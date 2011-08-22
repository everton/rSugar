#!/usr/bin/env ruby
#-*- coding: utf-8 -*-

## Say you want to convert an array of strings to uppercase
# result = names.map {|name| name.upcase}
# result = names.map(&:upcase)

class Symbol
  def to_proc
    proc { |obj, *args| obj.send(self, *args) }
  end
end
