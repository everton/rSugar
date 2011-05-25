#!/usr/bin/env ruby
#-*- coding: utf-8 -*-

a = Rational(2, 3)        # 2 / 3
b = (1.0 / 3).rationalize # 1 / 3

c = a + b

puts c
puts c == 1
