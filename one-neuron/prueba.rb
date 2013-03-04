#!/usr/bin/ruby

require 'rubygems'
require 'gruff'

g = Gruff::Dot.new
g.title = "Mi gráfica de prueba"

g.data("Java", [24, 25, 18])
g.data("C", [17.5, 17, 16.5])

g.labels = {0 => '2003'}

g.write('prueba.png')