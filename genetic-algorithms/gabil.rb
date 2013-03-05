class gabil

	attr_reader :population, :inputs, :outputs, :fitness, :fatherSelection1, :fatherSelection2, :survivorSelection1, :survivorSelection2

	attr_accessor :fitness_threshold, :n_features

	def inicialize(fitness_threshold, n_features, population)
		@population = population
		@inputs = []
		@outputs = []
		@fitness = []
		@fatherSelection1 = []
		@fatherSelection2 = []
		@survivorSelection1 = []
		@survivorSelection2 = []
		@fitness_threshold = fitness_threshold
		@n_features = n_features
	end

	def inicializePopulation()

	end

  def selection(population)
    send(@selection_method, population)
  end
  
	def roulette_wheel_selection(population)
		selected = []    
    current_fitness = []
    
    for i in population do
			current_fitness << fitness(i)
		end
		
		sum = current_fitness.inject(0.0){|res, item| res + item}
		probabilities = current_fitness.map{ |i| i / sum }
    
    ( (1 - @crossover_rate) * @population_size ).times do 
      # pick a random number and select the  individual 
      # corresponding to that roulette-wheel area
      r , inc = rand * probabilities.max, 0 
      population.each_index do |i| 
        if r < (inc += probabilities[i])
          selected << population[i]
          # make selection not pick sample twice
          population.delete_at i
          probabilities.delete_at i
          break
        end
      end
    end
		return selected
	end

	def fatherSelection2(x)

	end

	def survivorSelection1(x)

	end

	def survivorSelection2(x)

	end

	def addAlternative

	end

	def dropCondition

	end

  # Recibe el individuo con el cual se va a evaluar los ejemplos de entrenamiento
  # Fitness(x) = (correct(x))^2
	def fitness(x)

	end
	
	# Devuelve el porcentaje de ejemplos clasificados correctamente usando el conjunto
	# de reglas x
	def correct(x)
	end

	def recombine(x)

	end

	def mutate(x)

	end

	def load_examples(inputs, outputs, file_path, output_map = {}, separator = ",")
		File.open(file_path, "r") do |infile|
			while (line = infile.gets)
				tmp = line.split(separator)
			    tmp[n_features - 1 ] = output_map[tmp[n_features - 1]].nil? ? tmp[n_features - 1] : output_map[tmp[n_features - 1]]
			    #tmp.map!{|a| a.to_f}
			    outputs << tmp[n_features - 1]
			    inputs << (tmp[0,n_features - 1].concat([1.0]))
			end
		end
	end

end
