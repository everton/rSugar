#!/usr/bin/env ruby
#-*- coding: utf-8 -*-

OldStyle = Class.new do
  def name
    @name
  end

  def name=(name)
    @name = name
  end
end

FreshStyle = Class.new do
  attr_accessor :name
end
