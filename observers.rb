#!/usr/bin/env ruby
#-*- coding: utf-8 -*-

require "observer"

class Person ### Periodically fetch a stock price.
  include Observable

  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def name=(name)
    @name = name
    changed and notify_observers(self)
  end
end

class EmailNotification
  def initialize(person)
    person.add_observer(self)
  end

  def update(person)
    puts "Send email to #{person.name}"
  end
end

mulder = Person.new('Fox')
EmailNotification.new(mulder)
mulder.name = 'Fox Mulder'
