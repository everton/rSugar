#!/usr/bin/env ruby
#-*- coding: utf-8 -*-

# http://pragdave.blogs.pragprog.com/pragdave/2007/12/pipelines-using.html
class PipelineElement

  attr_accessor :source

  def initialize
    @fiber_delegate = Fiber.new do
      process
    end
  end

  def |(other)
    other.source = self
    other
  end

  def resume
    @fiber_delegate.resume
  end

  def process
    while value = input
      handle_value(value)
    end
  end

  def handle_value(value)
    output(value)
  end

  def input
    source.resume
  end

  def output(value)
    Fiber.yield(value)
  end
end

##
# The classes below are the elements in our pipeline
#
class Evens < PipelineElement
  def process
    value = 0
    loop do
      output(value)
      value += 2
    end
  end
end

class MultiplesOf < PipelineElement
  def initialize(factor)
    @factor = factor
    super()
  end
  def handle_value(value)
    output(value) if value % @factor == 0
  end
end

evens = Evens.new
multiples_of_three = MultiplesOf.new(3)
multiples_of_seven = MultiplesOf.new(7)

pipeline = evens | multiples_of_three | multiples_of_seven

10.times do
  puts pipeline.resume
end
