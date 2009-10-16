#!/usr/bin/env ruby -w

require "nxt"

$DEBUG = true

@nxt = NXT.new("/dev/tty.NXT-DevB-1")

@nxt.message_write(1,180)
@nxt.message_write(1,0)