#!/usr/bin/env ruby
#-*- coding: utf-8 -*-

require 'continuation'
c, x, y, i = callcc { |cc| [cc, 0, 1, 1] }
puts y
c.call(c, y, x + y, i + 1) if i < 20
