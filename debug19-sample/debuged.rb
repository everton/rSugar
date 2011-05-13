#!/usr/bin/env ruby
#-*- coding: utf-8 -*-

require 'ruby-debug'

def my_method
  a, b = 123, 456

  puts "before (a: #{a}, b: #{b})"
  debugger
  puts "after (a: #{a}, b: #{b})"
end

my_method
