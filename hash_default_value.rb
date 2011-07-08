#!/usr/bin/env ruby
#-*- coding: utf-8 -*-

h1, h2 = {}, Hash.new
puts "-" * 25
puts "      {}[:a] => #{h1[:a].inspect}"
puts "Hash.new[:a] => #{h2[:a].inspect}"
puts

h3 = Hash.new 0
puts "-" * 25
puts "   h = Hash.new 0"
puts "   ... h[:a] => #{h3[:a].inspect}"
h3[:a] += 1
puts "   h[:a] += 1"
puts "   ... h[:a] => #{h3[:a].inspect}"
puts "   ... h[:b] => #{h3[:b].inspect}"
puts

# No exactly what we wants
h4 = Hash.new []
puts "-" * 25
puts "   h = Hash.new []"
puts "   ... h[:a] => #{h4[:a].inspect}"
puts "   ... h[:b] => #{h4[:b].inspect}"
h4[:a] <<= 'aa'
puts "   h[:a] <<= 'aa'"
puts "   ... h[:a] => #{h4[:a].inspect} (h[:a].object_id => #{h4[:a].object_id})"
puts "   ... h[:b] => #{h4[:b].inspect} (h[:b].object_id => #{h4[:b].object_id})"
puts

h5 = Hash.new { [] }
puts "-" * 25
puts "   h = Hash.new { [] }"
puts "   ... h[:a] => #{h5[:a].inspect}"
puts "   ... h[:b] => #{h5[:b].inspect}"
h5[:a] << 'aa'
puts "   h[:a] << 'aa'"
puts "   ... h[:a] => #{h5[:a].inspect} (h[:a].object_id => #{h5[:a].object_id})"
puts "   ... h[:b] => #{h5[:b].inspect} (h[:b].object_id => #{h5[:b].object_id})"
h5[:a] <<= 'aa'
puts "   h[:a] <<= 'aa'"
puts "   ... h[:a] => #{h5[:a].inspect} (h[:a].object_id => #{h5[:a].object_id})"
puts "   ... h[:b] => #{h5[:b].inspect} (h[:b].object_id => #{h5[:b].object_id})"

puts
