#!/usr/bin/env ruby
#-*- coding: utf-8 -*-

class Test
  def test
    a = 1
    b = 2

    puts a + b
  end
end

set_trace_func proc { |event, file, line, id, binding, classname|
  printf "%8s %s:%-2d %10s %8s\n", event, file, line, id, classname
}

t = Test.new
t.test
