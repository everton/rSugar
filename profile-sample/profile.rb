#!/usr/bin/env ruby
#-*- coding: utf-8 -*-

require 'bundler/setup'
require 'ruby-prof'

result = RubyProf.profile do
  100.times do
    # a = Time.now
    File.open('delete-me', &:read)
  end
end

# RubyProf::GraphPrinter.new(result)
RubyProf::FlatPrinter.new(result).print(STDOUT, 0)
