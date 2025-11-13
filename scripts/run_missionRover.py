#!/usr/bin/env python3
#to run the script: "cd ardupilot/ArduCopter;../Tools/autotest/run-misson.py" 

import pexpect, time, sys
from pymavlink import mavutil
import os

init = 1

def wait_heartbeat(mav, timeout=10):
    '''wait for a heartbeat'''
    start_time = time.time()
    while time.time() < start_time+timeout:
        if mav.recv_match(type='HEARTBEAT', blocking=True, timeout=0.5) is not None:
            return
    raise Exception("Failed to get heartbeat")    

def print_current_mode(mav):
    '''Print the current flight mode of the vehicle.'''
    wait_heartbeat(mav, timeout=10)  # Ensure heartbeat is received
    print(f"Current Flight Mode: {mav.flightmode}")
    
    
def wait_mode(mav, modes, timeout=10):
    '''wait for one of a set of flight modes'''
    start_time = time.time()
    last_mode = None
    while time.time() < start_time+timeout:
        wait_heartbeat(mav, timeout=10)
        if mav.flightmode != last_mode:
            print("Flightmode %s" % mav.flightmode)
            last_mode = mav.flightmode
        if mav.flightmode in modes:
            return
    print("Failed to get mode from %s" % modes)
    sys.exit(1)
    
def wait_armed(mav, armed, timeout=10):
    ''''wait until is armed/disarmed'''
    start_time = time.time()
    while time.time() < start_time+timeout:
        wait_heartbeat(mav, timeout=10)
        print("wait for armed/disarmed:%d..."%(mav.motors_armed()),end="\r",flush=True)
        if mav.motors_armed() == armed:
            return
    # print("Failed to get armed/disarmed.")
    # sys.exit(1)
    
def wait_time(mav, simtime):
    '''wait for simulation time to pass'''
    imu = mav.recv_match(type='RAW_IMU', blocking=True)
    t1 = imu.time_usec*1.0e-6
    while True:
        imu = mav.recv_match(type='RAW_IMU', blocking=True)
        t2 = imu.time_usec*1.0e-6
        if t2 - t1 > simtime:
            break

def time_sleep(seconds):
    for i in range(seconds,0,-1):
        print(f"delay:{i}s...", end="\r",flush=True)
        time.sleep(1)

def run_mission(mavproxy,mission_fname):
    global init

    print("run mission starts..........")
    load_cmd = 'wp load ../Tools/autotest/mission/%s.txt\n' % str(mission_fname)
  
    # mavproxy.send('mode stabilize\n')
    mavproxy.send(load_cmd)
    #print_current_mode(mav)
    time_sleep(5)
    mavproxy.send('mode guided\n')
    wait_mode(mav, ['GUIDED'])
    # if (init == 1):
    mavproxy.send('arm throttle\n')
    #print_current_mode(mav)
    wait_armed(mav, armed=128,timeout=30) #128=armed_value
    # mavproxy.send('takeoff 100\n')
        # init = -1

    time_sleep(10)
    mavproxy.send('mode auto\n')
    #print_current_mode(mav)
    time_sleep(100)
    mavproxy.send('mode circle\n')
    time_sleep(60)
    mavproxy.send('mode loiter\n')
    time_sleep(20)
    # Check if the mission number is even
    mission_number = int(mission_fname.split('-')[-1])  # Extract the numeric part
    if mission_number % 2 == 0:
        print(f"Mission {mission_fname} is even. Repeating circle and loiter modes.")
        mavproxy.send('mode circle\n')
        time_sleep(50)
        mavproxy.send('mode loiter\n')
        time_sleep(20)

    mavproxy.send('rtl\n')
    time_sleep(90)
    mavproxy.send('mode circle\n')
    time_sleep(30)


    #wait_armed(mav, armed=False,timeout=600)
    #print_current_mode(mav)
    
    #close map if opened
    # mavproxy.send("module unload map\n")
    # mavproxy.expect("Unloaded module map")

    #close connection if needed
    # mav.close()
    # mavproxy.close()
    
    
def wait_home_reached(mav, timeout=300):
    '''Wait for the vehicle to reach the home location and land.'''
    start_time = time.time()
    while time.time() < start_time + timeout:
        msg = mav.recv_match(type='GLOBAL_POSITION_INT', blocking=True, timeout=1)
        if msg:
            lat, lon, alt = msg.lat / 1e7, msg.lon / 1e7, msg.relative_alt / 1000.0
            #print(f"Current position: Lat {lat}, Lon {lon}, Alt {alt:.2f}m")
            if alt < 1.0:  # Check if the altitude is below 1 meter (landed)
                print("Vehicle has landed.")
                return
    raise Exception("Home point not reached or landing failed.")


if __name__ == '__main__':
    #start mavproxy connection and setup until pre-arm good before running missions
    #cmd = '../Tools/autotest/sim_vehicle.py --map --console'
    cmd = '../Tools/autotest/sim_vehicle.py --console --map -w -N'
    mavproxy = pexpect.spawn(cmd, logfile=sys.stdout, timeout=30,encoding='utf-8')
    mav = mavutil.mavlink_connection('127.0.0.1:14550')
    time_sleep(55)


    #for mission_type in ['copter','rover']:
    for mission_type in ['copter']:
        # for fnum in range(1,5): #For Profiling (train)
        for fnum in range(5,21): #For Monitoring (test)
            mission_fname = "%s-%d" %(str(mission_type),fnum)
            print("----->start mission: %s.txt"% str(mission_fname))
            run_mission(mavproxy,mission_fname) 
            # mavproxy.send('rtl\n')
            # wait_mode(mav, ['RTL'], timeout=30) 
            #wait_home_reached(mav, timeout=300)
            # wait_armed(mav, armed=False,timeout=120)
            # time_sleep(50)
            # mavproxy.send('mode circle\n')
            # time_sleep(20)
            print("----->done mission: %s.txt"% str(mission_fname))
            
   
    
    #close map if opened
    # mavproxy.send("module unload map\n")
    # mavproxy.expect("Unloaded module map")
    
    # # Close MAVProxy console (if opened separately)
    # mavproxy.send("module unload console\n")

    # # Stop sim_vehicle.py properly
    # mavproxy.send("shutdown\n")  # This should stop sim_vehicle.py
    # time.sleep(5)  # Give it time to exit

    # # Close connections
    # mavproxy.close()
    # mav.close()

    print("============end of work=============")
