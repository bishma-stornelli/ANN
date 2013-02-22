require './learner'

begin
  # Main to solve question 3 and plot the charts needed
  file_path = "input/bupa.data"
  bests = {}
<<<<<<< HEAD
  INFINITY = 1.0/0.0
  file_path = "input/bupa.data"
  (2..10).each do |n_hidden|
    [0.5,0.6,0.7,0.8,0.9].each do |percentage|
      [0.01, 0.05, 0.1, 0.2, 0.3, 0.5, 0.7, 0.9, 0.95, 0.99].each do |learning_rate|
        l = Learner.new(6, n_hidden, learning_rate)
        l.load_training_examples(file_path, {"1" => "1", "2" => "0"})
=======
  [0.5,0.6,0.7,0.8,0.9].each do |percentage|
    (2..10).each do |n_hidden|
      [0.01, 0.05, 0.1, 0.2, 0.3, 0.5].each do |learning_rate|
        puts "Probando porcentaje #{percentage} con #{n_hidden} neuronas y tasa de aprendizaje #{learning_rate}"
        l = Learner.new(6, n_hidden, learning_rate, 1000)
        l.load_training_examples(file_path, {"1\n" => "1", "2\n" => "0"})
>>>>>>> e8fb97beb97c2ee4400a3a2e06969fafa6e7b12e
        l.split_examples(percentage)
        l.train
        
        bests[percentage] = {
            :n_hidden => -1, 
            :learning_rate => -1, 
            :error => {
              :testing => Float::INFINITY, :training => Float::INFINITY 
            },
            :learner => nil
          } if bests[percentage].nil?
        
        testing_error = l.error(l.testing_examples, l.testing_outputs)
        if testing_error < bests[percentage][:error][:testing]
          bests[percentage][:n_hidden] = n_hidden
          bests[percentage][:learning_rate] = learning_rate
          bests[percentage][:error][:testing] = testing_error
          bests[percentage][:error][:training] = l.error(l.training_examples, l.training_outputs)
          bests[percentage][:learner] = l
        end
      end
    end
  end
  
  f_config = File.open("outputs/configuration2", "w")
  f_config.write("percentage\t\tn_hidden\t\tlearning_rate\t\ttesting_error\t\ttraining_error\n")
    
  bests.each do |percentage, conf|
    f_config.write("#{percentage}\t\t#{conf[:n_hidden]}\t\t#{conf[:learning_rate]}" +
      "\t\t#{conf[:error][:testing]}\t\t#{conf[:error][:training]}\n")
    
    f1 = File.open("outputs/bupa_#{percentage}_0", "w")
    f2 = File.open("outputs/bupa_#{percentage}_1", "w")
    
    l = conf[:learner]
    l.training_examples.each do |e|
      o = e.dup
      o << l.evaluate(e).last
      f = o.last.round == 0 ? f1 : f2
      f.write("#{o.join(",")}\n")
    end
    f1.close
    f2.close
  end
  f_config.close
end
