#!/usr/bin/env ruby
#-*- coding: utf-8 -*-

Klass = Class.new do
  def initialize(str)
    @str = str
  end

  def sayHello
    puts @str
  end
end

mfile = "marshal.data.sample"

o = Klass.new("hello\n")

`rm #{mfile}` if File.exists?(mfile)
File.open(mfile, 'w') do|file|
  file.write Marshal.dump(o)
end

File.open(mfile, 'r') do|file|
  @obj = Marshal.load(file)
end

@obj.sayHello   #=> "hello\n"

