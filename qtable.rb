#!/usr/bin/ruby

class QTable
  
  attr_accessor :table, :rows, :columns

  def initialize(world,rows,columns)
    @table   = self.build world, rows, columns
    @rows    = rows.to_i
    @columns = columns.to_i
  end

  def build(world,rows,columns)
    table = Array.new(rows.to_i) { Array.new(columns.to_i) }
    
    world.each_with_index do |val,i|
      val.each_with_index do |el,j|

        case el
        when "0"
          default = 10.0
          reward  = 10.0
        when "&"
          default = -10.0
          reward  = -10.0
        else
          default = 0.0
          reward  = -1.0
        end

        table[i][j] = Node.new ({
          state: [i,j],
          el: el,
          action: "none", 
          reward: reward,
          values: {
            "up"    => default,
            "down"  => default,
            "right" => default,
            "left"  => default
          }
        })

      end
    end
    table
  end

  def to_s
    output = ""
    table.each do |val|
      val.each do |el|
        if !is_terminal(el) && !is_wall(el)
          output << el.to_s + "\n"
        end
      end
    end
    output
  end

  def direction(el)
    case el
    when "up"    then "^"
    when "right" then ">"
    when "left"  then "<"
    when "down"  then "v"
    end
  end

  def to_w
    output = ""
    table.each do |val|
      val.each do |el|
        if is_terminal(el) || is_wall(el)
          output << el.el 
        else
          output << direction(el.action)          
        end
      end
      output << "\n"
    end
    output
  end

end