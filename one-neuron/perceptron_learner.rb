class PerceptronLearner < Learner
  
  def train
    @weights = Array.new(@examples[0].size){ |i| rand }
    #@w0 = rand
    
    1.upto(Float::INFINITY) do |i|
    
      all_learned = true
    
      examples.each_with_index do |example, j|
      
        output = evaluate( example )
        
        all_learned &= update_weights(example, output, outputs[j])
        
      end
      
      break if all_learned
    end
  end
  
  protected
  
  def update_weights(example, current_output, expected_output)
    return true if current_output == expected_output
    tmp = learning_rate * ( expected_output - current_output )
    weights.map!.with_index do |weight, index|
      weight + tmp * example[index]
    end
    #@w0 += tmp
    false
  end
end
