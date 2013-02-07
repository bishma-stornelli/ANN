class PerceptronLearner < Learner
  
  def train
    @weights = Array.new(@examples[0].size){ |i| rand - rand }
    @iteration = 1
    while true do
    
    
      examples.each_with_index do |example, j|
      
        output = evaluate( example )
        
        update_weights(example, output, outputs[j])
        
      end
      log if log?
      break if error < 0.1 || @iteration > @max_iterations
      @iteration = @iteration + 1
    end
  end
  
  protected
  
  def update_weights(example, current_output, expected_output)
    return true if current_output == expected_output
    tmp = learning_rate * ( expected_output - current_output )
    tmp /= @iteration if descent_learning_rate?
    weights.map!.with_index do |weight, index|
      weight + tmp * example[index]
    end
    false
  end
end
