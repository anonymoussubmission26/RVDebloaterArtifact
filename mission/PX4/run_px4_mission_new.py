from pymavlink import mavutil
import time

# Connect to PX4 SITL (adjust port if needed)
master = mavutil.mavlink_connection('udp:127.0.0.1:14540')
master.wait_heartbeat()
print("✅ Heartbeat received!")

def send_shell_command(command: str):
    print(f"📤 Sending shell command: {command}")
    # Fill the data buffer to 70 bytes as required by MAVLink spec
    data = command.encode('utf-8')
    if len(data) > 70:
        raise ValueError("Command too long!")
    data += b'\0' * (70 - len(data))

    master.mav.serial_control_send(
        device=0,          # 0: shell
        flags=0b00000001,  # has_data
        timeout=0,
        baudrate=0,        # ignored
        count=len(command),
        data=data
    )

# Example: takeoff and switch to AUTO mode
send_shell_command("commander takeoff")
time.sleep(10)
send_shell_command("commander mode auto:mission")

