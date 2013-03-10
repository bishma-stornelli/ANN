require './hypothesis'

class Population < Array
  def dup
    p = Population.new self.size
    self.each_with_index do |hypothesis, i|
      p[i] = hypothesis.dup
    end
    p
  end
end
