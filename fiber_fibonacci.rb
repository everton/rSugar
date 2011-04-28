#!/usr/bin/env ruby
#-*- coding: utf-8 -*-

fib = Fiber.new do
  x, y = 0, 1
  loop do
    Fiber.yield y
    x,y = y,x+y
  end
end

20.times { puts fib.resume }
