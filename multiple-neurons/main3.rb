require './learner'

begin
  # Main to solve question 3 and plot the charts needed
  bests = {}
  INFINITY = 1.0/0.0
  file_path = "input/bupa.data"
  (2..10).each do |n_hidden|
    [0.5,0.6,0.7,0.8,0.9].each do |percentage|
      [0.01, 0.05, 0.1, 0.2, 0.3, 0.5, 0.7, 0.9, 0.95, 0.99].each do |learning_rate|
        l = Learner.new(6, n_hidden, learning_rate)
        l.load_training_examples(file_path, {"1" => "1", "2" => "0"})
        l.split_examples(percentage)
        l.train
        
        bests[file_path] = {
            :n_hidden => -1, 
            :learning_rate => -1, 
            :error => {
              :testing => Float::INFINITY, :training => Float::INFINITY 
            },
            :learner => nil
          } if bests["input/bupa.data"].nil?
        
        testing_error = l.error(l.testing_examples, l.testing_examples)
        if testing_error < bests[file_path][:error][:testing]
          bests[file_path][:n_hidden] = n_hidden
          bests[file_path][:learning_rate] = learning_rate
          bests[file_path][:error][:testing] = testing_error
          bests[file_path][:error][:training] = l.error(l.training_examples, l.training_outputs)
          bests[file_path][:learner] = l
        end
      end
    end
  end
  
  f_config = File.open("outputs/configuration2", "w")
  f_config.write("n_hidden\t\tlearning_rate\t\ttesting_error\t\ttraining_error\n")
    
  bests.each do |file_path, conf|
    f_config.write("#{conf[:n_hidden]}\t\t#{conf[:learning_rate]}" +
      "\t\t#{conf[:error][:testing]}\t\t#{conf[:error][:training]}\n")
    
    f1 = File.open("outputs/#{file_path}_0", "w")
    f2 = File.open("outputs/#{file_path}_1", "w")
    
    l = conf[:learner]
    l.training_examples.each do |e|
      o = e.dup
      o << l.evaluate(e).last
      f = o.last == 0 ? f1 : f2
      f.write("#{o.join(",")}\n")
    end
    f1.close
    f2.close
  end
  f_config.close
end
