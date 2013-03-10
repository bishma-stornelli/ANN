require './rule.rb'

class Hypothesis < Array
  def dup
    h = Hypothesis.new self.size
    self.each_with_index do |rule, i|
      h[i] = rule.dup
    end
    h
  end
end
