require './rule.rb'

class Hypothesis < Array

  def self.build_from_attr_rule_sizes(ars, flat)
    return Hypothesis.new if ars.empty? || flat.empty?
    size_of_rule = ars.inject(0){|acc, elem| acc + elem}

    number_of_rules = flat.size / size_of_rule

    h = Hypothesis.new number_of_rules

    elems_taken = 0
    number_of_rules.times do |i|
      h[i] = Rule.new
      ars.each do |size_of_attr_rule|
        h[i] << flat[elems_taken, size_of_attr_rule]
        elems_taken += size_of_attr_rule
      end
    end
    h
  end

  def dup
    h = Hypothesis.new self.size
    self.each_with_index do |rule, i|
      h[i] = rule.dup
    end
    h
  end

  def crossover_with(hypothesis)
    offspring1, offspring2 = [], []
    ds = deep_size()
    rs = rule_size()

    # Selecciono dos puntos en el self para hacer crossover
    point1 , point2 = [rand(ds), rand(ds)].sort
    d1, d2 = point1 % rs, point2 % rs

    point3, point4 = 0, 0

    if d1 < d2
      point3 = d1 + rs * rand(hypothesis.size)
      point4 = point3 - d1 + d2  + rs * rand(hypothesis.size - (point3 / rs))
    else
      point3 = d1 + rs * rand(hypothesis.size - 1).round
      point4 = (point3 - d1 + rs) + d2 + rs * rand(hypothesis.size - ((point3 + rs) / rs))
    end

    offspring1.concat self.deep_flatten(0, point1)
    offspring1.concat hypothesis.deep_flatten(point3, point4)
    offspring1.concat self.deep_flatten(point2)

    offspring2.concat hypothesis.deep_flatten(0, point3)
    offspring2.concat self.deep_flatten(point1, point2)
    offspring2.concat hypothesis.deep_flatten(point4)

    [Hypothesis.build_from_attr_rule_sizes(attr_rule_sizes, offspring1),
      Hypothesis.build_from_attr_rule_sizes(attr_rule_sizes, offspring2)]
  end

  def deep_flatten(bit1 = 0, bit2 = deep_size)
    return [] if empty? || bit2 < bit1

    flat = []
    starting_rule = bit1 / first.deep_size  rescue 0
    starting_attr_rule = bit1 % first.deep_size rescue 0

    ending_rule = bit2 / first.deep_size rescue 0
    ending_attr_rule = bit2 % first.deep_size rescue 0

    if starting_rule != ending_rule
      flat.concat send(:[], starting_rule).deep_flatten(starting_attr_rule)
      send(:[], starting_rule + 1, ending_rule - starting_rule).each do |rule|
        flat.concat rule.deep_flatten
      end if ending_rule - starting_rule > 1
      flat.concat send(:[], ending_rule).deep_flatten(0, ending_attr_rule) unless send(:[], ending_rule).nil?
    else
      flat.concat send(:[], starting_rule).deep_flatten(starting_attr_rule, ending_attr_rule)
    end
    flat
  end

  def deep_size
    inject(0){|acc, rule| acc + rule.deep_size}
  end

  def rule_size
    empty? ? 0 : first.deep_size
  end

  def attr_rule_sizes
    return [] if empty?

    rule = first
    sizes = Array.new rule.size
    rule.each_with_index do |attr_rule, i|
      sizes[i] = attr_rule.size
    end
    sizes
  end
end
