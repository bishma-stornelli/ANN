# population es un arreglo de tamano population_size de la forma
# cuyos elementos son arreglos que representan un conjunto de reglas.
# Cada elemento del conjunto es un arreglo que representa una simple regla
# y cuyo tamano dependera del numero de valores que puedan tomar las variables
# discretas asociadas al problema a resolver.
# Para resumir:
#   population[i] = i-esimo individuo (conjunto de reglas)
#   population[i][j] = j-esima regla del i-esimo individuo
class Gabil

	attr_reader :population_size, :population, :inputs, :outputs, :fitness, :fatherSelection1, :fatherSelection2, :survivorSelection1, :survivorSelection2, :training_population

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

	def inicializePopulation()

	end

	def fatherSelection1(x)

		result = []

		sum = x.inject(0){|res,item| res + item}

		for k in inputs do
			@fatherSelection1[k] = @fitness[k].to_f/sum
		end

		propability = (1.0 - @crossover_rate.to_f)/@population_size

		propability.times do
			i = rand x.size
			result << x.delete_at(i)
		end

		return result

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

	def fitness(x)

	end

	def recombine(x)

	end

	def mutate(x)

	end

	def load_examples(inputs, outputs, file_path, separator = ",")

		inputs = []
		result = []
		aux = []
		a2 = [2]
		a3 = [3]
		a8 = [8]
		a11 = [11]
		a14 = [14]
		a15 = [15]

		File.open(file_path, "r") do |infile|
			while (line = infile.gets)
				tmp = line.split(separator)
				inputs << tmp
				a2 << tmp[1].to_f
				a3 << tmp[2].to_f
				a8 << tmp[7].to_f
				a11 << tmp[10].to_f
				a14 << tmp[13].to_f
				a15 << tmp[14].to_f
			    @outputs << tmp[@n_features - 1]
			end
		end

		inputs.each_with_index do |i, n|

			aux = []

			aux << case i[0]
				when "a" then [1,0]
				else [0,1]
			end

			h = (a2.max - a2.min)/3

			if i[1].to_f >= a2.min && i[1].to_f < h
				aux << [1,0,0]
			elsif i[1].to_f >= h && i[1].to_f < h*2
				aux << [0,1,0]
			else
				aux << [0,0,1]
			end

			h = (a3.max - a3.min)/3

			if i[2].to_f >= a3.min && i[2].to_f < h
				aux << [1,0,0]
			elsif i[2].to_f >= h && i[2].to_f < h*2
				aux << [0,1,0]
			else
				aux << [0,0,1]
			end

			aux << case i[3]
				when "u" then [1,0,0,0]
				when "y" then [0,1,0,0]
				when "l" then [0,0,1,0]
				else [0,0,0,1]
			end

			aux << case i[4]
				when "g" then [1,0,0]
				when "p" then [0,1,0]
				else [0,0,1]
			end

			aux << case i[5]
				when "c" then [1,0,0,0,0,0,0,0,0,0,0,0,0,0]
				when "d" then [0,1,0,0,0,0,0,0,0,0,0,0,0,0]
				when "cc" then [0,0,1,0,0,0,0,0,0,0,0,0,0,0]
				when "i" then [0,0,0,1,0,0,0,0,0,0,0,0,0,0]
				when "j" then [0,0,0,0,1,0,0,0,0,0,0,0,0,0]
				when "k" then [0,0,0,0,0,1,0,0,0,0,0,0,0,0]
				when "m" then [0,0,0,0,0,0,1,0,0,0,0,0,0,0]
				when "r" then [0,0,0,0,0,0,0,1,0,0,0,0,0,0]
				when "q" then [0,0,0,0,0,0,0,0,1,0,0,0,0,0]
				when "w" then [0,0,0,0,0,0,0,0,0,1,0,0,0,0]
				when "x" then [0,0,0,0,0,0,0,0,0,0,1,0,0,0]
				when "e" then [0,0,0,0,0,0,0,0,0,0,0,1,0,0]
				when "aa" then [0,0,0,0,0,0,0,0,0,0,0,0,1,0]
				else [0,0,0,0,0,0,0,0,0,0,0,0,0,1]
			end

			aux << case i[6]
				when "v"  then [1,0,0,0,0,0,0,0]
				when "h"  then [0,1,0,0,0,0,0,0]
				when "bb" then [0,0,1,0,0,0,0,0]
				when "j"  then [0,0,0,1,0,0,0,0]
				when "n"  then [0,0,0,0,1,0,0,0]
				when "z"  then [0,0,0,0,0,1,0,0]
				when "dd" then [0,0,0,0,0,0,1,0]
				when "ff" then [0,0,0,0,0,0,0,1]
				else [0,0,0,0,0,0,0,1]
			end

			h = (a8.max - a8.min)/3

			if i[7].to_f >= a8.min && i[7].to_f < h
				aux << [1,0,0]
			elsif i[7].to_f >= h && i[7].to_f < h*2
				aux << [0,1,0]
			else
				aux << [0,0,1]
			end

			aux << case i[8]
				when "t" then [1,0]
				else [0,1]
			end

			aux << case i[9]
				when "f" then [1,0]
				else [0,1]
			end

			h = (a11.max - a11.min)/3

			if i[10].to_f >= a11.min && i[10].to_f < h
				aux << [1,0,0]
			elsif i[10].to_f >= h && i[10].to_f < h*2
				aux << [0,1,0]
			else
				aux << [0,0,1]
			end

			aux << case i[11]
				when "t" then [1,0]
				else [0,1]
			end

			aux << case i[12]
				when "g" then [1,0,0]
				when "p" then [0,1,0]
				else [0,0,1]
			end

			h = (a14.max - a14.min)/3

			if i[13].to_f >= a14.min && i[13].to_f < h
				aux << [1,0,0]
			elsif i[13].to_f >= h && i[13].to_f < h*2
				aux << [0,1,0]
			else
				aux << [0,0,1]
			end

			h = (a15.max - a15.min)/3

			if i[14].to_f >= a15.min && i[14].to_f < h
				aux << [1,0,0]
			elsif i[14].to_f >= h && i[14].to_f < h*2
				aux << [0,1,0]
			else
				aux << [0,0,1]
			end

			result << aux

		end

		print result[0]

	end

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
