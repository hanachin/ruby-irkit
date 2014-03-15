$:.unshift File.expand_path '../lib', File.dirname(__FILE__)

require 'irkit'

device = IRKit::Device.find.first
unless device
  STDERR.puts 'device not found'
  exit 1
end

p device

unless data = device.get_messages
  STDERR.puts 'IR data not found'
  exit 1
end

puts 'rewrite IR data'
device.post_messages data
