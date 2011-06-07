#!/usr/bin/env ruby
#-*- coding: utf-8 -*-

dev1 = Object.new
dev1.define_singleton_method :program do
  "Developer #{object_id} coding..."
end

dev2 = dev1.clone
dev3 = dev1.dup

puts dev1.program
puts dev2.program
puts dev3.program

