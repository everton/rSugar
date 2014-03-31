#!/usr/bin/env ruby
#-*- coding: utf-8 -*-

first, second = :lisp, :smalltalk

puts "first: #{first} second: #{second}"

first, *rest = :lisp, :smalltalk, :ruby

puts "first: #{first} rest: #{rest}"

first, *, last = :lisp, :java, :smalltalk

puts "first: #{first} last: #{last}"
