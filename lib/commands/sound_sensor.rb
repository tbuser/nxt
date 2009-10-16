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

require "nxt"
require "commands/mixins/sensor"

# Implements the "Sound Sensor" block in NXT-G
class Commands::SoundSensor
  
  include Commands::Mixins::Sensor
  
  attr_reader :port, :mode
  attr_accessor :trigger_point, :comparison
  
  def initialize(nxt)
    @nxt      = nxt
    
    # defaults the same as NXT-G
    @port           = 2
    @trigger_point  = 50
    @comparison     = ">"
    @mode           = "dba"
    set_mode
  end
  
  def mode=(mode)
    @mode = mode
    set_mode
  end
  
  # scaled value read from sensor
  def sound_level
    value_scaled
  end
  
  # returns the raw value of the sensor
  def raw_value
    value_raw
  end
  
  # sets up the sensor port
  def set_mode
    @nxt.set_input_mode(
      NXT.const_get("SENSOR_#{@port}"),
      NXT.const_get("SOUND_#{@mode.upcase}"),
      NXT::PCTFULLSCALEMODE
    )
  end
  
  # attempt to return the input_value requested
  def method_missing(cmd)
    @nxt.get_input_values(NXT.const_get("SENSOR_#{@port}"))[cmd]
  end
end
