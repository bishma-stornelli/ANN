class Rule < Array
  def dup
    r = Rule.new self.size
    self.each_with_index do |attr_rule, i|
      r[i] = attr_rule.dup
    end
    r
  end

  def deep_flatten(bit1 = 0, bit2 = deep_size)
    return [] if empty?

    flatten[bit1, bit2 - bit1]    
  end

  def deep_size
    inject(0){|acc, elem| acc + elem.size}
  end
end
