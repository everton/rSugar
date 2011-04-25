#!/usr/bin/env ruby
#-*- coding: utf-8 -*-

require 'forwardable'
class Queue
  extend Forwardable

  def initialize
    @q = [ ]    # prepare delegate object
  end

  # setup preferred interface, enq() and deq()...
  def_delegator :@q, :push, :enq
  def_delegator :@q, :shift, :deq

  # support some general Array methods that fit Queues well
  def_delegators :@q, :clear, :first, :push, :shift, :size
end

q = Queue.new
q.enq 1, 2, 3, 4, 5
q.push 6

q.shift    # => 1
puts q.deq while q.size > 0

q.enq "Ruby", "Perl", "Python"
puts q.first
q.clear
puts q.first

