# Control Mindstorms NXT via Bluetooth or USB
# Copyright (C) 2006-2009 Tony Buser <tbuser@gmail.com> - http://tonybuser.com
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software Foundation,
# Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
#

# Command object based interface that implements the "blocks" in NXT-G.  This should
# be easy to understand if you are familiar with the NXT-G graphical programming
# system.  This is automatically included in NXTComm.
#
# === Example
#
#   require 'nxt_comm'
# 
#   @nxt = NXT.new('/dev/tty.NXT-DevB-1')
#
#   # more examples can be found in examples/commands.rb
#
#   us = Commands::UltrasonicSensor.new(@nxt)
#   us.mode = :centimeters
#   puts "Distance: #{us.distance}cm"
#   us.mode = :inches
#   puts "Distance: #{us.distance}in"
# 
#   us.comparison = "<"
#   us.trigger_point = 5
# 
#   while us.logic == false
#     sleep(0.5)
#     puts "Move #{us.comparison} #{us.trigger_point} #{us.mode} from the sensor..."
#     puts "Distance: #{us.distance}in"
#   end
# 
#   puts "Got it!"
#
module Commands
  require 'commands/move'
  require 'commands/sound'
  require 'commands/motor'
  
  require 'commands/touch_sensor'
  require 'commands/sound_sensor'
  require 'commands/light_sensor'
  require 'commands/ultrasonic_sensor'
  require 'commands/rotation_sensor'
end