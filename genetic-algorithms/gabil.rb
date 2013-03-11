require 'benchmark'

# population es un arreglo de tamano population_size de la forma
# cuyos elementos son arreglos que representan un conjunto de reglas.
# Cada elemento del conjunto es un arreglo que representa una simple regla
# y cuyo tamano dependera del numero de valores que puedan tomar las variables
# discretas asociadas al problema a resolver.
# Para resumir:
#   population[i] = i-esimo individuo (conjunto de reglas)
#   population[i][j] = j-esima regla del i-esimo individuo
#   population[i][j][k] = k-esimo atributo de la j-esima regla del i-esimo individuo
class Gabil
	attr_accessor :population_size, :population, :new_population
  attr_reader :best_hypothesis, :best_fitness
	attr_accessor :selection_method, :mutation_rate, :crossover_rate

	def initialize(population, training_examples, options = {} )
	  options = {
	    :mutation_rate => 0.001,
	    :crossover_rate => 0.6,
	    :drop_condition => false,
	    :add_alternative => false,
	    :penalized_fitness => false,
	    :selection_method => :roulette_wheel_selection
	  }.merge(options)
	 	@population = population.dup
		@population_size = population.size
		@training_examples = training_examples
		@mutation_rate = options[:mutation_rate]
		@crossover_rate = options[:crossover_rate]
		@drop_condition = options[:drop_condition]
		@add_alternative = options[:add_alternative]
		@penalized_fitness = options[:penalized_fitness]
		@selection_method = options[:selection_method]
		@best_hypothesis = []
		@best_fitness = 0
		@current_fitness = calculate_fitness
	end
	
	def evolve
  	Benchmark.bm do |x|
  	  @new_population = Population.new
      	x.report("selection"){ selection }
	    x.report("crossover"){ crossover }
	    x.report("mutate"){ mutate }
	    x.report("calculate fitness"){ @current_fitness = calculate_fitness @new_population }
	    x.report("select survivors"){ } # DEBERIA ELIMINAR EL FITNESS DE LOS ELEMENTOS QUE NO SOBREVIVEN
	    x.report("update"){ @population = @new_population }
	  end
	end
	
	# Delega la funcionalidad de seleccion al metodo @selection_method, pasandole
	# el numero de padres a elegir para aparearse
  def selection
    send(@selection_method, ( (1 - @crossover_rate) * @population_size ).round)
  end
  
  # Selecciona new_size individuos probabilisticamente segun el fitness
  # que aporta a la suma de fitness de toda la poblacion. Los individuos seleccionados
  # son eliminados de @population
	def roulette_wheel_selection( new_size )
	
		sum = @current_fitness.inject(0.0){ |res, item| res + item }
		if sum == 0 
		  # there is no hypothesis in population which classify at least one example
		  # therefore, every hipothesis is equally "good" with respect to the others
		  probabilities = Array.new( @population_size , 1.0 / @population_size )
		else
    	probabilities = @current_fitness.map{ |i| i / sum }
    end
		
		puts "probabilities of being selected: #{probabilities.inspect}" if $DEBUG
		
    new_size.times do 
      # pick a random number and select the  h 
      # corresponding to that roulette-wheel area
      r , inc = rand * probabilities.max, 0 
      @population.each_index do |i| 
        if r < (inc += probabilities[i])
          @new_population << @population.delete_at(i)
          probabilities.delete_at(i)
          break
        end
      end
    end
    puts "Hypothesis selected = #{@new_population.inspect}" if $DEBUG
    @new_population
	end

  # Selecciona new_size individuos de los cuales los new_size / 2 primeros son
  # aquellos con mejor fitness y los restantes son seleccionados aleatoriamente.
  # Elimina los elementos seleccionados de @population
	def elitist_selection( new_size )
    
    sorted_population = @population.sort do |a, b| 
      @current_fitness[@population.index(a)] <=> @current_fitness[@population.index(b)]
    end
    
    (new_size / 2).times do
      @new_population << @population.delete_at( 0 )
    end
    
    while(@new_population.size < new_size )
      @new_population << @population.delete_at( rand( @population.size) )
    end
    
    @new_population
	end

  def crossover(parents)
    offspring = Hypothesis.new

    parents.each do |parent1, parent2|
      offspring.concat(parent1.crossover_with(parent2))
    end
    offspring
  end

	def add_alternative(attribute)
		mutated_population = @new_population.sample( (0.01 * @new_population.size).round )

		mutated_population.each do |hypothesis|
			random_attr = random_attr(hypothesis)
			random_attr[rand random_attr.length] = 1
		end
	end

	def drop_condition(attribute)
		mutated_population = @new_population.sample( (0.6 * @new_population.size).round )

		mutated_population.each do |hypothesis|
		
			random_attr = random_attr(hypothesis)
			random_attr.map!{ 1 }
						
		end
	end

	def recombine(x)

	end

	def mutate
	  puts "Selecting #{(@mutation_rate * @new_population.size).round} to mutate" if $DEBUG1
	
    mutated_population = @new_population.sample( (@mutation_rate * @new_population.size).round )

    mutated_population.each_with_index do |hypothesis, i|
      random_attr = random_attr(hypothesis)
      bit_index = rand(random_attr.size)
      # Muto un bit: si era 1 lo pongo en 0 y si era 0 lo pongo en 1
      random_attr[bit_index] = (random_attr[bit_index] - 1).abs
    end
    drop_condition if @drop_condition
    add_alternative if @add_alternative
    
	end

	def sturges
		return (1 + 3.322*Math.log10(@population_size)).round
	end

	#private
	
	def calculate_fitness( p = @population )
	  puts "Starting to calculate fitness of population" if $DEBUG
	  @current_fitness ||= Array.new p.size
    p.each_with_index do |hypothesis, index|
      # Hypothesis is of the form: [rule, rule, rule, ...]
      f = fitness(hypothesis)
      puts "\tFitness of hypothesis is #{f} and of the best hypothesis is #{@best_fitness}" if $DEBUG
      @best_fitness, @best_hypothesis = f , hypothesis.dup if f > @best_fitness
			@current_fitness[index] = f
		end
		@current_fitness
	end
	
	# Recibe el individuo con el cual se va a evaluar los ejemplos de entrenamiento
  # fitness(h) = (correct(h))^2
	def fitness(hypothesis)
	  puts "\tStarting to calculate fitness of hypothesis with #{hypothesis.size} rules" if $DEBUG
    [(correct(hypothesis)) ** 2 - (@penalized_fitness ? hypothesis.size : 0) , 1.0].max
	end
	
	# Devuelve el porcentaje de ejemplos clasificados correctamente usando el conjunto
	# de reglas h
	def correct(hypothesis)
	  correct = 0
	  @training_examples.each do |example|
	    # Example is of the form: [attr_rule, attr_rule, ...]
	    correct += (match_example?(hypothesis, example) ? 1 : 0)
	  end
	  correct
	end
	
	def match_example?(hypothesis, example)
	  puts "\t\tStarting to compare example #{example.inspect} against hypothesis" if $DEBUG
	  rules_matched = 0
	  hypothesis.each do |rule|
	    rule_match = match_rule?(rule, example)
	    rules_matched += (rule_match ? 1 : 0)
	    # Si hace match pero la salida es diferente, no es correcto
	    return false if rule_match && rule.last != example.last
	  end
	  # Es correcto si al menos una regla hizo match
    rules_matched > 0
	end
	
	def match_rule?(rule, example)
	  puts "\t\t\tStarting to compare example againts rule #{rule.inspect}" if $DEBUG
	  example[(0..-2)].each_with_index do |attr_rule, index|
	    return false unless match_attr_rule? rule[index], attr_rule
	  end
    true
	end
	
	def match_attr_rule?(attr_rule_hypothesis, attr_rule_example)
	  puts "\t\t\tComparing attr rule from hypothesis #{attr_rule_hypothesis.inspect} againts #{attr_rule_example}" if $DEBUG
	  attr_rule_example.each_with_index do |elem, i|
	    return false if elem == 1 && attr_rule_hypothesis[i] == 0
	  end
	  return true
	end
	
	def random_attr(hypothesis)
	  rule_index = rand(hypothesis.size)
    attr_index = rand(hypothesis[rule_index].size)
    hypothesis[rule_index][attr_index]
	end
end
