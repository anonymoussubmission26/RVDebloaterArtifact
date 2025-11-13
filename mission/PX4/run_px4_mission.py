import asyncio
import json
import glob
import re
from mavsdk import System
from mavsdk.mission import MissionItem, MissionPlan

async def load_plan(filename):
    with open(filename, 'r') as f:
        data = json.load(f)

    mission_items = []
    default_speed = data['mission'].get('cruiseSpeed', 10)  # default speed from plan or 10

    for item in data['mission']['items']:
        lat = item['params'][4]
        lon = item['params'][5]
        alt = item['params'][6]
        command = item['command']
        is_fly_through = item.get('autoContinue', True)

        if command == 16:  # NAV_WAYPOINT
            mission_items.append(
                MissionItem(
                    lat,
                    lon,
                    alt,
                    default_speed,
                    is_fly_through,
                    float('nan'),  # gimbal_pitch_deg
                    float('nan'),  # gimbal_yaw_deg
                    MissionItem.CameraAction.NONE,  # camera_action
                    0.0,          # loiter_time_s
                    0.0,          # camera_photo_interval_s
                    5.0,          # acceptance_radius_m
                    float('nan'), # yaw_deg
                    0.0,          # camera_photo_distance_m
                    MissionItem.VehicleAction.NONE  # vehicle_action
                )
            )

        elif command == 22:  # TAKEOFF
            mission_items.append(
                MissionItem(
                    lat,
                    lon,
                    alt,
                    default_speed,
                    is_fly_through,
                    float('nan'),  # gimbal_pitch_deg
                    float('nan'),  # gimbal_yaw_deg
                    MissionItem.CameraAction.NONE,  # camera_action
                    0.0,          # loiter_time_s
                    0.0,          # camera_photo_interval_s
                    5.0,          # acceptance_radius_m
                    float('nan'), # yaw_deg
                    0.0,          # camera_photo_distance_m
                    MissionItem.VehicleAction.NONE  # vehicle_action
                )
            )
        else:
            # Skip other commands for now
            pass

    return MissionPlan(mission_items)

async def run_single_mission(drone, plan_file):
    print(f"--- Running mission: {plan_file} ---")
    mission_plan = await load_plan(plan_file)

    print("Uploading mission...")
    await drone.mission.clear_mission()
    await drone.mission.upload_mission(mission_plan)

    print("Arming...")
    await drone.action.arm()

    print("Taking off...")
    await drone.action.takeoff()
    await asyncio.sleep(10)

    print("Starting mission...")
    await drone.mission.start_mission()

    async for mission_progress in drone.mission.mission_progress():
        print(f"Mission progress: {mission_progress.current}/{mission_progress.total}")
        if mission_progress.current == mission_progress.total:
            print("Mission completed")
            break

    print("Returning to launch...")
    await drone.action.return_to_launch()

    await asyncio.sleep(30)  # Wait for RTL to complete
    print("Disarming...")
    await drone.action.disarm()
    print(f"--- Mission {plan_file} done ---\n")

def get_mission_files_in_range(start_num, end_num, pattern="mission_variant_*.plan"):
    files = glob.glob(pattern)

    def extract_number(filename):
        match = re.search(r"mission_variant_(\d+)\.plan", filename)
        return int(match.group(1)) if match else -1

    # Filter and keep only files in range
    filtered_files = [
        f for f in files if start_num <= extract_number(f) <= end_num
    ]

    # Sort by extracted number
    return sorted(filtered_files, key=extract_number)

async def run_missions_in_range(start_num, end_num):
    drone = System()
    print("Connecting to drone...")
    await drone.connect(system_address="udp://:14540")

    async for state in drone.core.connection_state():
        if state.is_connected:
            print("Connected to drone!")
            break

    print("Waiting for global position estimate...")
    async for health in drone.telemetry.health():
        if health.is_global_position_ok and health.is_home_position_ok:
            print("Global position estimate OK")
            break

    mission_files = get_mission_files_in_range(start_num, end_num)
    if not mission_files:
        print(f"No mission files found in range mission_variant_{start_num}.plan to mission_variant_{end_num}.plan")
        return

    print(f"Running missions from mission_variant_{start_num}.plan to mission_variant_{end_num}.plan:")
    for f in mission_files:
        print(" -", f)
    print()

    for plan_file in mission_files:
        await run_single_mission(drone, plan_file)

    print("All missions completed.")

if __name__ == "__main__":
    try:
        start_num = int(input("Enter start mission number: "))
        end_num = int(input("Enter end mission number: "))
        if end_num < start_num:
            print("End number must be greater or equal to start number.")
            exit(1)
    except ValueError:
        print("Invalid input. Please enter integer numbers.")
        exit(1)

    asyncio.run(run_missions_in_range(start_num, end_num))

