require File.dirname(__FILE__) + '/learner.rb'
require File.dirname(__FILE__) + '/delta_learner.rb'
require File.dirname(__FILE__) + '/perceptron_learner.rb'

begin

  %w(and.data or.data xor.data).each do |data|
    [0.01, 0.05, 0.1, 0.2, 0.3, 0.4, 0.5, 0.99].each do |learning_rate|
      [PerceptronLearner, DeltaLearner].each do |learner|
        [false, true].each do |descent_learning_rate|
          puts "#{data}_#{learner.name.to_s}_#{descent_learning_rate}_#{learning_rate}"
          l = learner.new data, 
                          learning_rate, 
                          descent_learning_rate,
                          "outputs/#{data}_#{learner.name.to_s}_#{descent_learning_rate}_#{learning_rate}.cvs"
          l.load_examples
          l.train 
        end
      end
    end
  end
  
end
