
def qlearning(rate,discount,qtable,i,exp_ratio)
  
  node = qtable.table[3][1]

  while i > 0
    action = action(node.values,exp_ratio)	
    node2  = move(qtable,action,node)

    fst_term = (1-rate) * node.values[action] 
    snd_term = rate * (node2.reward + discount * (max_value(node2.values)))
    node.values[action] = fst_term + snd_term

    node = node2
    i -= 1
  end

  qtable = update_actions(qtable)

  qtable
end

def directions(action,state)
  i,j = state
  direction = {
  	"up"    => [i-1,j],
  	"down"  => [i+1,j],
  	"right" => [i,j+1],
  	"left"  => [i,j-1]
  }
  direction[action]
end

def move(qtable,action,node)
  i,j = directions(action,node.state)
  tmp = qtable.table[i][j]

  if is_wall(tmp)
  	node
  else
  	if is_terminal(node)
  	  random_node(qtable)
  	else
  	  tmp
  	end
  end
end

def update_actions(qtable)
  qtable.table.each do |arr|
  	arr.each do |node|
  	  node.action = best_action(node.values)
  	end
  end
  qtable
end

def best_action(values)
  max(values).shift
end

def action(values,e)
  rand < e ? random_action : best_action(values)
end

def is_terminal node
  node.el == '0' || node.el == '&' ? true : false
end

def is_wall(node)
  node.el == "#" ? true : false 
end

def max(values)
  values.max_by{|k,v| v}
end

def max_value(values)
  max(values).pop
end

def random_action
  ["up","down","right","left"].at(rand 4)
end

def random_node(qtable)
  i = rand (qtable.rows - 1) 
  j = rand (qtable.columns - 1)
  tmp = qtable.table[i][j]
  !is_terminal(tmp) && !is_wall(tmp) ? tmp : random_node(qtable)
end

=begin
def boltzmann(values)
  temperature = 10
  probs = {
  	"up"    => Math.exp(values["up"]/temperature),
  	"down"  => Math.exp(values["down"]/temperature),
  	"right" => Math.exp(values["right"]/temperature),
  	"left"  => Math.exp(values["left"]/temperature)
  }

  p probs

  total = probs.inject(0) {|sum,(k,v)| sum + v}
  probs.each {|k,v| probs[k] = v.to_f/total.to_f} 

  best_action(probs)
end
=end
