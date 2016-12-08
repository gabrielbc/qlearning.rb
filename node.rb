#!/usr/bin/ruby

class Node
  
  attr_accessor :state, :el, :action, :reward, :values

  def initialize(params = {})
    @state  = params[:state]
    @el     = params[:el]
    @action = params[:action]
    @reward = params[:reward]
    @values = params[:values]
  end

  def to_s
    state[0].to_s + "," + state[1].to_s + "," + action + "," + values[action].to_s
  end

  def debug
     "\nNode | State " + state.at(0).to_s + " " + state.at(1).to_s +
     " | El: " + el +
     "\nAction: " + action +
     " Values: " + "up:" + values["up"].to_s + ", right:" + values["right"].to_s +
     ", down:" + values["down"].to_s + ", left:" + values["left"].to_s + "\n"
  end

end