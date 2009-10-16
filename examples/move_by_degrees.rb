#!/usr/bin/env ruby -w

require "nxt"

$DEBUG = false

@nxt = NXT.new('/dev/tty.NXT-DevB-1')
@degrees = 360
@motor = NXT::MOTOR_B

# set the tacho_count = 0
@nxt.reset_motor_position(@motor)

puts @nxt.get_output_state(@motor).inspect

# ramps up to (close to) requested degrees and then if no other command is sent, it will 
# try to return to the requested degrees if force moves motor

# have to start at least power = 1 to ramp up
@nxt.set_output_state(@motor,1,NXT::MOTORON | NXT::BRAKE | NXT::REGULATED,
  NXT::REGULATION_MODE_MOTOR_SPEED,0,NXT::MOTOR_RUN_STATE_RUNNING,0)

# ramp up to the requested degrees
@nxt.set_output_state(@motor,75,NXT::MOTORON | NXT::BRAKE | NXT::REGULATED,
  NXT::REGULATION_MODE_MOTOR_SPEED,0,NXT::MOTOR_RUN_STATE_RAMPUP,@degrees)

until @nxt.get_output_state(@motor)[:run_state] == NXT::MOTOR_RUN_STATE_IDLE
  puts @nxt.get_output_state(@motor).inspect
  sleep(0.5)
end

# abruptly break and use power to prevent movement
# @nxt.set_output_state(@motor,0,NXT::MOTORON | NXT::BRAKE | NXT::REGULATED,
# NXT::REGULATION_MODE_MOTOR_SPEED,0,NXT::MOTOR_RUN_STATE_RUNNING,0)

# coast to a stop and allow force to move motor
# @nxt.set_output_state(@motor,0,NXT::COAST,
#   NXT::REGULATION_MODE_IDLE,0,NXT::MOTOR_RUN_STATE_IDLE,0)

puts @nxt.get_output_state(@motor).inspect

@nxt.close
