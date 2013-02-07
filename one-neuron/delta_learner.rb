class DeltaLearner < Learner
  def train
    @weights = Array.new(@examples[0].size){ |i| rand - rand }
    
    #puts outputs.inspect
      
    #puts "\tweights = #{weights}"
    
    1.upto(Float::INFINITY) do |i|
      #puts "Iteration #{i}"
      delta_weight = Array.new weights.size, 0
      
      
      current_outputs = []
      examples.each_with_index do |example, j|
        
        current_outputs << evaluate( example )

        tmp = learning_rate * (outputs[j] - current_outputs.last)
        
        delta_weight.map!.with_index { |dw, k| dw + tmp * example[k] }
        #weights.map!.with_index{ |w,k| w + tmp * example[k] }
      end

      #puts "\tdelta_weight = #{delta_weight.inspect}"
      #puts "\texpected_outputs = #{outputs}"
      #puts "\tcurrent_outputs = #{current_outputs}"
      
      weights.map!.with_index{ |w,j| w + delta_weight[j] }
      
      puts "weights = #{weights}"
      puts "delta_weights = #{delta_weight}"
      puts "error = #{error}"
      sleep 0.1
      break if error < 0.1
    end
  end
  
  #def puts arg
  #  print "#{arg}\n"
  #  sleep(3)
  #end
end
