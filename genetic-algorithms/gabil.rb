# population es un arreglo de tamano population_size de la forma
# cuyos elementos son arreglos que representan un conjunto de reglas.
# Cada elemento del conjunto es un arreglo que representa una simple regla
# y cuyo tamano dependera del numero de valores que puedan tomar las variables
# discretas asociadas al problema a resolver.
# Para resumir:
#   population[i] = i-esimo individuo (conjunto de reglas)
#   population[i][j] = j-esima regla del i-esimo individuo
class Gabil

  attr_reader :population_size, :population, :inputs, :outputs, :fitness, :fatherSelection1, :fatherSelection2, :survivorSelection1, :survivorSelection2

	attr_accessor :fitness_threshold, :n_features, :mutation_rate, :crossover_rate

	def initialize(population, options = {} )
	  options = {
	    :population_size => 100,
	    :fitness_threshold => 0.01,
	    :mutation_rate => 0.001,
	    :crossover_rate => 0.6,
	    :selection_method => :roulette_wheel_selection
	  }.merge(options)
	  @population = population.dup
		@population_size = options[:population_size]
		@fitness_threshold = options[:fitness_threshold]
		@mutation_rate = options[:mutation_rate]
		@crossover_rate = options[:crossover_rate]
		@current_fitness = calculate_fitness
	end
	
	def evolve
	  parents = selection
	  crossover
	  mutate
	  update
	  calculate_fitness
	end
	
	# Delega la funcionalidad de seleccion al metodo @selection_method, pasandole
	# el numero de padres a elegir para aparearse
  def selection
    send(@selection_method, ( (1 - @crossover_rate) * @population_size ))
  end
  
  # Selecciona new_size individuos probabilisticamente segun el fitness
  # que aporta a la suma de fitness de toda la poblacion. Los individuos seleccionados
  # son eliminados de @population
	def roulette_wheel_selection!( new_size )
		selected = []
    
    for i in @population do
			current_fitness << fitness(i)
		end
		
		sum = @current_fitness.inject(0.0){|res, item| res + item}
		probabilities = @current_fitness.map{ |i| i / sum }
		
    new_size.times do 
      # pick a random number and select the  h 
      # corresponding to that roulette-wheel area
      r , inc = rand * probabilities.max, 0 
      @population.each_index do |i| 
        if r < (inc += probabilities[i])
          selected << @population.delete_at(i)
          probabilities.delete_at(i)
          break
        end
      end
    end
    selected
	end

  # Selecciona new_size individuos de los cuales los new_size / 2 primeros son
  # aquellos con mejor fitness y los restantes son seleccionados aleatoriamente.
  # Elimina los elementos seleccionados de @population
	def elitist_selection!( new_size )
    selected = []
    
    sorted_population = @population.sort do |a, b| 
      @current_fitness[@population.index(a)] <=> @current_fitness[@population.index(b)]
    end
    
    (new_size / 2).times do
      selected << @population.delete_at( 0 )
    end
    
    while(selected.size < new_size )
      selected << @population.delete_at( rand( @population.size) )
    end
    
    selected
	end

	def survivorSelection1(x)

	end

	def survivorSelection2(x)

	end

	def addAlternative

	end

	def dropCondition

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
	
	private
	
	def calculate_fitness    
    population.each do |h, index|
			@current_fitness[index] = fitness(h)
		end
	end
	
	# Recibe el individuo con el cual se va a evaluar los ejemplos de entrenamiento
  # fitness(h) = (correct(h))^2
	def fitness(h)
    (correct(h)) ** 2
	end
	
	# Devuelve el porcentaje de ejemplos clasificados correctamente usando el conjunto
	# de reglas h
	def correct(h)
	  correct = 0
	  @training_examples.each do |example|
	    correct += match_example?(h, example) ? 1 : 0
	  end
	end
	
	def match_example?(h, e)
	  h.each do |rule|
	    return true if match? rule, e
	  end
	  false
	end
	
	def match?(rule, example)
	  example.each_with_index do |e, i|
	    return false if e == 1 && rule[i] == 0
	  end
    true
	end
end
