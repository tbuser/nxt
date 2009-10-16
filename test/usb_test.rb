#!/usr/bin/env ruby -w

#require 'rubygems'
require "nxt"

$DEBUG = true
# $DEV = "/dev/tty.NXT-DevB-1"

@nxt = NXT.new

@nxt.play_sound_file("Woops.rso")
