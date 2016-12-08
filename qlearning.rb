#!/usr/bin/ruby

require_relative 'qtable'
require_relative 'node'
require_relative 'util'

world_s = ""
world_matrix = []

file       = ARGV[0]
rate       = ARGV[1].to_f
discount   = ARGV[2].to_f
iterations = ARGV[3].to_i
exp_ratio  = ARGV[4].to_f

f = File.open(file, "r")
f.each_line { |line| world_s << line }
f.close

world_lines = world_s.split("\n")
dimensions  = world_lines.shift
dimensions  = dimensions.split(' ')
world_lines.each { |el| world_matrix.push(el.split "") }

rows    = dimensions[0]
columns = dimensions[1]

q = QTable.new(world_matrix,rows,columns)

qtable = qlearning(rate,discount,q,iterations,exp_ratio)

puts qtable
puts qtable.to_w

File.open("q.txt", 'w') { |file| file.write(qtable.to_s) }
File.open("pi.txt", 'w') { |file| file.write(qtable.to_w) }