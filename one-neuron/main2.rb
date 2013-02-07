require File.dirname(__FILE__) + '/learner.rb'
require File.dirname(__FILE__) + '/delta_learner.rb'

begin
  3.times do |i|
    [40,80,120,160,200].each do |training_size|
      puts "#{i} #{training_size}"
      l = DeltaLearner.new "bupa.data", 
                      0.1, 
                      false,
                      "outputs/bupa_#{training_size}_#{i}.cvs"
      l.load_examples true
      l.split_examples(training_size)
      l.train
      
    end
  end
end
