#!/usr/bin/env ruby
#-*- coding: utf-8 -*-

sentence = %r{
    (?<subject>   cat   | dog   | gerbil    ){0}
    (?<verb>      eats  | drinks| generates ){0}
    (?<object>    water | bones | PDFs      ){0}
    (?<adjective> big   | small | smelly    ){0}

    (?<opt_adj>   (\g<adjective>\s)?     ){0}

    The\s\g<opt_adj>\g<subject>\s\g<verb>\s\g<opt_adj>\g<object>
}x # x -> ignore whitespace between regex tokens

md = sentence.match("The cat drinks water")
puts "The subject is #{md[:subject]} and the verb is #{md[:verb]}"

md = sentence.match("The big dog eats smelly bones")
puts "The adjective in the second sentence is #{md[:adjective]}"

sentence =~ "The gerbil generates big PDFs"
puts "And the object in the last is #{$~[:object]}"
