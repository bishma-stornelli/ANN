require File.dirname(__FILE__) + '/learner.rb'

begin
  bfl = BooleanFunctionsLearner.new

  #%w(and or xor).map{|e| e.to_sym}.each do |function|
  #  [0.01, 0.05, 0.1, 0.2, 0.3, 0.4, 0.5, 0.99].each do |learning_rate|
  #    %w(perceptron_rule delta_rule incremental_gradient_descent).map{|e| e.to_sym}.each do |learning_rule|
  #      [false, true].each do |descent_learning_rate|
  #        bfl.train :function => function, 
  #                  :learning_rate => learning_rate, 
  #                  :output_file => "#{function}_#{learning_rule}_#{descent_learning_rate}_#{learning_rate}.cvs", 
  #                  :learning_rule => learning_rule,
  #                  :descent_learning_rate => descent_learning_rate
  #        puts "#{function}_#{learning_rule}_#{descent_learning_rate}_#{learning_rate} valid" if bfl.valid?
  #      end
  #    end
  #  end
  #end
  
  bfl.train :function => :and, 
            :learning_rate => 0.1, 
            :output_file => "test", 
            :learning_rule => :incremental_gradient_descent,
            :descent_learning_rate => false
  puts bfl.check
  
end
