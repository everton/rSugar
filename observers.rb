#!/usr/bin/env ruby
#-*- coding: utf-8 -*-

require "observer"

class Person
  include Observable

  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def name=(name)
    if(@name != name)
      @name = name
      changed
    end

    notify_observers(self)
  end
end

class EmailNotification
  def update(person)
    puts "Send email to '#{person.name}'"
  end
end

class SMSNotification
  def update(person)
    puts "Send SMS   to '#{person.name}'"
  end
end

mulder = Person.new('Fox')
mulder.add_observer(EmailNotification.new)
mulder.add_observer(SMSNotification.new)

mulder.name = 'Fox'
mulder.name = 'Fox Mulder'
