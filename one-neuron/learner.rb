class Learner

  attr_accessor :input_file, :outputs, 
                :examples, :weights, 
                :learning_rate, :log_file, 
                :iteration, :max_iterations, 
                :descent_learning_rate,
                :test_examples,
                :test_outputs
  def initialize(input_file, learning_rate = 0.1, descent_learning_rate = false, log_file = nil, max_iterations = 5000)
    @input_file = input_file
    @outputs = []
    @examples = []
    @weights = []
    @learning_rate = learning_rate
    @log_file = log_file  
    @iteration = 0
    @max_iterations = max_iterations
    @descent_leraning_rate = descent_learning_rate
    @minimum_error = Float::INFINITY
    @weights_for_minimum_error = []
    @test_examples = nil
    @test_outputs = nil
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
  
  def split_examples(n = 40)
    @test_examples = @examples
    @test_outputs = @outputs
    @examples = []
    @outputs = []
    n.times do
      i = rand @test_examples.size
      @examples << @test_examples.delete_at(i)
      @outputs << @test_outputs.delete_at(i)
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
  
  def error(exs = nil, ops = nil)
    exs ||= examples
    ops ||= outputs
    sum = 0
    exs.each_with_index do |e, i|
      sum += (ops[i] - evaluate(e))**2
    end
    
    return sum / exs.size.to_f
  end
  
  def log?
    !@log_file.nil?
  end
  
  def log
    File.open(@log_file, "a") do |f|
      f.write("#{@iteration},#{error}#{@test_examples.nil? ? "" : ",#{error(@test_examples, @test_outputs)}"},#{@weights.join(",")}\n")
    end
  end
  
  def descent_learning_rate?
    descent_learning_rate
  end
end
