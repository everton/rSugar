#!/usr/bin/env ruby
#-*- coding: utf-8 -*-

OldStyle = Class.new do
  private_class_method :new

  def self.instance
    @@instance ||= new
  end
end

require 'singleton'
FreshStyle = Class.new do
  include Singleton
end
