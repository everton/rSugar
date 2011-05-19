#!/usr/bin/env ruby
#-*- coding: utf-8 -*-

require 'benchmark'

# puts Benchmark.measure { "a"*1_000_000 }

n = 1000_000
Benchmark.bm do |x|
  x.report('for  ') { for i in 1..n; a = "1"; end }
  x.report('times') { n.times do   ; a = "1"; end }
  x.report('upto ') { 1.upto(n) do ; a = "1"; end }
end
