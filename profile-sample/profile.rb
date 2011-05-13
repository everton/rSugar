#!/usr/bin/env ruby
#-*- coding: utf-8 -*-

require 'bundler/setup'
require 'ruby-prof'

result = RubyProf.profile do
  "a" * 1_000_000
end

# RubyProf::GraphPrinter.new(result)
RubyProf::FlatPrinter.new(result).print(STDOUT, 0)
