import asyncio
import os
from mavsdk import System

async def run_mission(drone, plan_file):
    print(f"=====> Running mission from {plan_file}")

    print("-- Importing mission plan")
    try:
        await drone.mission_raw.clear_mission()
        await drone.mission_raw.import_qgroundcontrol_mission(plan_file)
    except Exception as e:
        print(f"Failed to load mission from {plan_file}: {e}")
        return

    print("-- Arming")
    await drone.action.arm()

    print("-- Taking off")
    await drone.action.takeoff()
    await asyncio.sleep(10)

    print("-- Starting mission (AUTO.MISSION)")
    await drone.mission_raw.start_mission()

    print("-- Monitoring mission progress")
    async for progress in drone.mission.mission_progress():
        print(f"  Mission progress: {progress.current}/{progress.total}")
        if progress.current == progress.total:
            print("  -> Mission complete")
            break

    # Optional: repeat circle mode or RTL depending on filename
    mission_number = int(plan_file.split('-')[-1].split('.')[0])
    if mission_number % 2 == 0:
        print("  -> Even mission number: simulating repeated loiter")
        await asyncio.sleep(20)

    print("-- Returning to launch")
    await drone.action.return_to_launch()
    await asyncio.sleep(15)

    print("-- Disarming")
    await drone.action.disarm()
    print(f"=====> Done with mission {plan_file}\n")


async def main():
    drone = System()
    await drone.connect(system_address="udp://127.0.0.1:14600")

    print("Waiting for drone connection...")
    async for state in drone.core.connection_state():
        if state.is_connected:
            print("Drone connected!")
            break

    print("Waiting for GPS and home position lock...")
    async for health in drone.telemetry.health():
        if health.is_global_position_ok and health.is_home_position_ok:
            print("GPS OK, ready to fly")
            break

    # Mission loop
    mission_dir = "PX4"
    for i in range(3, 21):  # Replace with (20, 40) for test phase
        mission_file = f"mission_variant_{i}.plan"
        plan_path = os.path.join(mission_dir, mission_file)
        if os.path.exists(plan_path):
            await run_mission(drone, plan_path)
        else:
            print(f"Mission file {plan_path} not found!")

    print("============ All missions complete ============")

if __name__ == "__main__":
    asyncio.run(main())

