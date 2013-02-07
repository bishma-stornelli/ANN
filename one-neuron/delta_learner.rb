class DeltaLearner < Learner
  def train
    @weights = Array.new(@examples[0].size){ |i| rand - rand }

    @iteration = 1
    while true do
    
      delta_weight = Array.new weights.size, 0      
      
      current_outputs = []
      examples.each_with_index do |example, j|
        
        current_outputs << evaluate( example )

        tmp = learning_rate * (outputs[j] - current_outputs.last)
        tmp /= i if descent_learning_rate?
        
        delta_weight.map!.with_index { |dw, k| dw + tmp * example[k] }

      end
      
      weights.map!.with_index{ |w,j| w + delta_weight[j] }
      log if log?
      break if error < 0.1 || @iteration > @max_iterations
      @iteration = @iteration + 1
    end
  end
  
end
