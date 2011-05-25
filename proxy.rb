#!/usr/bin/env ruby
#-*- coding: utf-8 -*-

Proxy = Class.new(BasicObject) do
  def initialize(subject)
      @subject = subject
  end

  def method_missing(message, *args, &block)
    ::STDOUT.puts "Before method called"
    ret = @subject.send(message, *args, &block)
    ::STDOUT.puts "After method called"
    ret
  end
end

Kkk = Class.new do
  def mmm
    puts "from #mmm"
  end
end

k = Kkk.new
k.mmm
# => MMM

pk = Proxy.new k
pk.mmm
# => MMM

puts "-----"
puts pk.is_a? Kkk
puts pk.class
# => true
