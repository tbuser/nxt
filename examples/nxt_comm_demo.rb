#!/usr/local/bin/ruby

require "nxt"

$DEBUG = false

@nxt = NXT.new("/dev/tty.NXT-DevB-1")
# puts "Connected!"
# 
# puts "Starting program"
# @nxt.start_program("Try-Touch.rtm")
# sleep(3)
# puts "Currently running: " + @nxt.get_current_program_name
# puts "Stopping program"
# @nxt.stop_program
# 
# @nxt.play_sound_file("Good Job.rso")

@nxt.play_tone(500,500)

# @nxt.set_output_state(
#   NXT::MOTOR_A,
#   100,
#   NXT::REGULATED,
#   NXT::REGULATION_MODE_MOTOR_SPEED,
#   100,
#   NXT::MOTOR_RUN_STATE_RUNNING,
#   0
# )
# sleep(3)
# @nxt.set_output_state(
#   NXT::MOTOR_A,
#   100,
#   NXT::BRAKE,
#   NXT::REGULATION_MODE_MOTOR_SPEED,
#   0,
#   NXT::MOTOR_RUN_STATE_RAMPDOWN,
#   0
# )

# set_input_mode(port,type,mode)
# @nxt.set_input_mode(NXT::SENSOR_3,NXT::LIGHT_INACTIVE,NXT::RAWMODE)
# while true
#   s = @nxt.get_input_values(NXT::SENSOR_3)
#   puts s.inspect
#   sleep(1)
# end

# puts @nxt.get_output_state(NXT::MOTOR_B).inspect

# puts @nxt.get_input_values(NXT::SENSOR_1).inspect

# @nxt.reset_input_scaled_value(NXT::SENSOR_1)

# @nxt.message_write(1,"Chunky Robotic Bacon!")

# @nxt.reset_motor_position(NXT::MOTOR_B)

# puts "Battery Level: #{@nxt.get_battery_level/1000.0} V"

#@nxt.play_sound_file("Woops.rso",true)
#sleep(2)
#@nxt.stop_sound_playback

@nxt.close