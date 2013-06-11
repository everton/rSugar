#!/usr/bin/env ruby
#-*- coding: utf-8 -*-

is_weekday = lambda {|day_of_week, time|
  time.wday == day_of_week
}.curry  # <<<  #curry

sunday    = is_weekday[0]
monday    = is_weekday[1]
tuesday   = is_weekday[2]
wednesday = is_weekday[3]
thursday  = is_weekday[4]
friday    = is_weekday[5]
saturday  = is_weekday[6]

case Time.now
when sunday  # works using Proc#=== (defined on 1.9 to Proc#call)
  puts "Day of rest"
when monday, tuesday, wednesday, thursday, friday
  puts "Work"
when saturday
  puts "chores"
end
