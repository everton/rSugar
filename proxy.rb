#!/usr/bin/env ruby
#-*- coding: utf-8 -*-

Proxy = Class.new(BasicObject) do
  def initialize(subject)
      @subject = subject
  end

  def method_missing(message, *args, &block)
    # ...
    ret = @subject.send(message, *args, &block)
    # ...
    ret
  end
end

Kkk = Class.new do
  def mmm
    puts "MMM"
  end
end

k = Kkk.new
k.mmm
# => MMM

pk = Proxy.new k
pk.mmm
# => MMM

pk.is_a? Kkk
# => true
