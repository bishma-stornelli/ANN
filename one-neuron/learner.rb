class Learner

  attr_accessor :input_file, :outputs, :examples, :weights, :learning_rate
  def initialize(input_file, learning_rate = 0.1)
    @input_file = input_file
    @outputs = []
    @examples = []
    @weights = []
    @learning_rate = learning_rate
  end
  
  # Load file @input_file supposing that each line has an example with
  # comma-separated values and the last value is the expected output
  def load_examples(normalize_data = false)
    mins, maxs = nil, nil
    File.open(@input_file, "r") do |infile|
      while (line = infile.gets)
        tmp = line.split(",").map{|a| a.to_f}
        @outputs << tmp.pop
        @examples << [1].concat(tmp)
        if normalize_data
          mins = @examples[0].dup if mins.nil?
          maxs = @examples[0].dup if maxs.nil?
          @examples.last.each_with_index do |v,i|
            mins[i] = v < mins[i] ? v : mins[i]
            maxs[i] = maxs[i] < v ? v : maxs[i]
          end
        end
      end
    end
    
    if normalize_data
      
      @examples.map! do |example|
        example.map.with_index do |v,i|
          if maxs[i] - mins[i] == 0
            v
          else
            (v - mins[i]) / (maxs[i] - mins[i])
          end
        end
      end
      @outputs.map! do |v|
        v == 2 ? -1 : 1
      end
    end
  end
  
  def train
    raise NotImplementedError  
  end
  
  def evaluate(example)
    sum = 0
    @weights.each_with_index do |w, i|
      sum += w * example[i]
    end
    sum > 0 ? 1 : -1
  end
  
  def error
    sum = 0
    examples.each_with_index do |e, i|
      sum += (outputs[i] - evaluate(e))**2
    end
    
    return sum / 2  
  end
  
end
