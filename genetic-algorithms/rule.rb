class Rule < Array
  def dup
    r = Rule.new self.size
    self.each_with_index do |attr_rule, i|
      r[i] = attr_rule.dup
    end
    r
  end
end
