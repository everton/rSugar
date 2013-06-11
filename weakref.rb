#!/usr/bin/env ruby
#-*- coding: utf-8 -*-

class Person
  def hello
    puts "Hello, I'm #{self.object_id}"
  end
end

class WeakRef
  @@ids = {}
  @@final = Proc.new{|id| # Defined here because closures
    puts "finalizing: #{id}"
    @@ids[id].reset!
    @@ids.delete(id)
  }

  def initialize(target)
    @target_id = target.object_id

    @@ids[@target_id] = self

    ObjectSpace.define_finalizer(target, @@final)
  end

  def reset!; @target_id = nil; end

  def method_missing(sym, *args, &block)
    begin
      raise RangeError.new unless @target_id
      ObjectSpace._id2ref(@target_id)
        .send(sym, *args, &block)
    rescue RangeError
      raise 'TargetUnreachable' unless @target_id
    end
  end
end

require 'thread'

def test # Don't create blocks here, take care with closures
  w = WeakRef.new(Person.new)
  w.hello

  GC.enable
  GC.start

  return w
end

Thread.exclusive do
  begin
    w1 = test
    w2 = test

    GC.enable
    GC.start

    w1.hello
    w2.hello
  rescue => e
    puts e.inspect
  end
end
