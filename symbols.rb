#!/usr/bin/env ruby
#-*- coding: utf-8 -*-

str1 = 'potato'
str2 = 'potato'

sym1 = :potato
sym2 = :potato

# comparision by value - N+1 (length + n*chars)
puts "str1 == str2 => #{str1 == str2}"

# comparision by #object_id - 1
puts "sym1 == sym2 => #{sym1 == sym2}"
puts "str1 == sym1 => #{str1 == sym1}"

puts
puts "str1.object_id: #{str1.object_id}"
puts "str2.object_id: #{str2.object_id}"
puts "sym1.object_id: #{sym2.object_id}"
puts "sym2.object_id: #{sym2.object_id}"
