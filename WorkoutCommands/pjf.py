import random
import subprocess
import time
import os

def jump_audio():
    audio_file = "/Users/jasperlin0330/Desktop/Personal_Projects/PJF_drills/JumpAudio.wav"
    return_code = subprocess.call(["afplay", audio_file])

def switch_audio():
    audio_file = "/Users/jasperlin0330/Desktop/Personal_Projects/PJF_drills/SwitchAudio.wav"
    return_code = subprocess.call(["afplay", audio_file])
# Legend:
# Hip Flip (FLIP)
# MOVE Laterally (LAT)
def mirrorReaction():
    second = 0
    minute = 0
    while (repTime >= second):
        if second == 0:
            print("0 : 0 START")
        time.sleep(1)
        second+=1
        if second == 60:
            second = 0
            minute += 1
        randTime = random.randrange(1,4)
        time.sleep(randTime)
        second += randTime
        timeStamp = '%d : %d '%(minute,second)
        randMove = random.randrange(0,4)
        if randMove == 0:
            print(timeStamp + "FLIP LEFT")
        elif randMove == 1:
            print(timeStamp + "FLIP RIGHT")
        elif randMove == 2:
            print(timeStamp + "LAT LEFT")
        else:
            print(timeStamp + "LAT RIGHT")
    
def nervousSystemBlaster(repTime):
    second = 0
    minute = 0
    while (repTime >= second):
        if second == 0:
            print("0 : 0 START")
        time.sleep(1)
        second+=1
        if second == 60:
            second = 0
            minute += 1
        randTime = random.randrange(1,4)
        time.sleep(randTime)
        second += randTime
        timeStamp = '%d : %d '%(minute,second)
        if random.randrange(0,2) == 0:
            switch_audio()
            print(timeStamp + "SWITCH")
        else:
            jump_audio()
            print(timeStamp + "JUMP")
    
    
nervousSystemBlaster(10)



