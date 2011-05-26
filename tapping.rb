#!/usr/bin/env ruby
#-*- coding: utf-8 -*-

(1..10)                 .tap {|x| puts "original: #{x.inspect}" }
  .to_a                 .tap {|x| puts "array:    #{x.inspect}" }
  .select {|x| x%2==0 } .tap {|x| puts "evens:    #{x.inspect}" }
  .map    {|x| x*x    } .tap {|x| puts "squares:  #{x.inspect}" }
