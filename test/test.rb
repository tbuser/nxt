#!/usr/bin/env ruby -w

require "nxt"

$DEBUG = true
@nxt = NXT.new('/dev/tty.NXT-DevB-1')

find = @nxt.find_first("Fantastic.rso")
puts "Found: #{find[:name]}"
read = @nxt.open_read(find[:name])
puts "Opened: #{read[:handle]}, Size: #{read[:size]}"
data = @nxt.read_file(read[:handle],read[:size])
puts data.inspect

@nxt.close_handle(find[:handle])
@nxt.close_handle(read[:handle])

# this fails, fix later
if false
  str = "This is a test...\nThis is a new line."
  handle = @nxt.open_write("test.txt",str.size)
  puts "Got handle: #{handle}"
  wrote = @nxt.write_file(handle,str)
  puts "Wrote: #{wrote.inspect}"
  closed = @nxt.close_handle(handle)
  puts "Closed handle: #{closed}"
end