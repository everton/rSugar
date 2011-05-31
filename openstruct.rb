#!/usr/bin/env ruby
#-*- coding: utf-8 -*-

require 'ostruct'

record = OpenStruct.new
record.name    = "John Smith"
record.age     = 70
record.pension = 300

puts record.name     # -> "John Smith"
puts record.address  # -> nil

hash = { "country" => "Australia", :population => 20_000_000 }
data = OpenStruct.new(hash)

p data        # -> <OpenStruct country="Australia" population=20000000>
