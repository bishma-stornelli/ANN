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
	attr_accessor :population_size, :population
	attr_reader :best_hypothesis, :best_fitness, :current_fitness, :current_iteration
	attr_accessor :parent_selection_method, :survivor_selection_method, :mutation_rate, :crossover_rate, :new_population
  attr_accessor :drop_condition, :add_alternative, :penalized_fitness

	def initialize(population, training_examples, options = {} )
	  options = {
	    :mutation_rate => 0.1,
	    :crossover_rate => 0.6,
	    :drop_condition => false,
	    :add_alternative => false,
	    :penalized_fitness => false,
	    :parent_selection_method => :roulette_wheel_selection,
	    :survivor_selection_method => :elitist_selection
	  }.merge(options)
	 	@population = population.dup
		@population_size = population.size
		@training_examples = training_examples
		@mutation_rate = options[:mutation_rate]
		@crossover_rate = options[:crossover_rate]
		@drop_condition = options[:drop_condition]
		@add_alternative = options[:add_alternative]
		@penalized_fitness = options[:penalized_fitness]
		@parent_selection_method = options[:parent_selection_method]
		@survivor_selection_method = options[:survivor_selection_method]
		@best_hypothesis = Hypothesis.new
		@best_fitness = 0
		@current_fitness = calculate_fitness
    @current_iteration = 0
	end
	
	def evolve
    #puts "Obteniendo padres"
    parents = father_selection
    #assert parents.size == ((@crossover_rate * @population_size)/2).round, "Selection method gave more couples than needed"
    #assert parents.all?{|couple| couple.size == 2}, "El metodo de seleccion no esta regresando parejas"
    #assert parents.all?{|couple| couple.all?{|h| h.all?{|r| r.size == 16}}}, "EL metodo de seleccion dio hipotesis con reglas de tamano diferente a 16"
    #puts "Obteniendo hijos"
    offspring = crossover parents

    #assert offspring.size == ((@crossover_rate * @population_size) / 2).round * 2, "crossover no creo 2 hijos por cada pareja de padres"
    #assert offspring.all?{|h| h.all?{|r| r.size == 16}}, "crossover regreso hijos con reglas de diferente tamano"
    #puts "Mutando"
    mutate offspring

    #assert offspring.size == ((@crossover_rate * @population_size) / 2).round * 2, "mutate cambio el tamano de los hijos"
    #assert offspring.all?{|h| h.all?{|r| r.size == 16}}, "mutate cambio el tamano de las reglas de los hijos"

    @new_population = @population.concat( offspring )
    @current_fitness = calculate_fitness @new_population
    #puts "seleccionando supervivientes"
    @population, @current_fitness = select_survivors
    @current_iteration += 1
	end
	
	# Delega la funcionalidad de seleccion al metodo @selection_method, pasandole
	# el numero de padres a elegir para aparearse
  def father_selection
    send(@parent_selection_method, ((@crossover_rate * @population_size)/2).round)
  end

  def select_survivors
    send(@survivor_selection_method)
  end
  
	def roulette_wheel_selection( number_of_couples )
	
		sum = @current_fitness.inject(0.0){ |res, item| res + item }
		if sum == 0 
		  # there is no hypothesis in population which classify at least one example
		  # therefore, every hipothesis is equally "good" with respect to the others
		  probabilities = Array.new( @population_size , 1.0 / @population_size )
		else
    	probabilities = @current_fitness.map{ |i| i / sum }
  	end
		
		#puts "probabilities of being selected: #{probabilities.inspect}" if $DEBUG
		
    parents = Population.new
    number_of_couples.times do # number_of_couples indica el numero de parejas que vamos a seleccionar 
      couple = Hypothesis.new
      2.times do
       	r , inc = rand * probabilities.max, 0
        @population.each_index do |i| 
          if r < (inc += probabilities[i])
            couple << @population[i]
            break
          end
        end
      end
    	parents << couple
  	end
    parents
	end

  # Selecciona number_of_couples individuos probabilisticamente y selecciona el mejor
  # fitness del grupo como padre. Los individuos seleccionados NO son eliminados de 
  # @population. k es el numero de padres que se quieren seleccionar
	def tournament_selection( number_of_couples )

		tournament = Hypothesis.new
		tournament_fitness = Hypothesis.new
		parents = Population.new

		tournament_size = (@population_size/2)

		number_of_couples.times do
      selected = []
			tournament = []
			tournament_fitness = []
			tournament_size.times do
				i = rand(@population_size)
        redo if selected.include? i
        selected << i
				tournament << @population[i]
				tournament_fitness << @current_fitness[i]
			end			
      couple = []
      2.times do
  			max = tournament_fitness.max
        parent_index = tournament_fitness.index(max)
        tournament_fitness.delete_at(parent_index)
        couple << tournament.delete_at(parent_index)
      end
      parents << couple
		end

		#puts "Hypothesis selected = #{parents.inspect}" if $DEBUG
		parents
	end

  # Selecciona new_size individuos de los cuales los new_size / 2 primeros son
  # aquellos con mejor fitness y los restantes son seleccionados aleatoriamente.
  # Elimina los elementos seleccionados de @population
	def elitist_selection
    selected = Population.new
    selected_fitness = Array.new

    new_population_and_fitness = @new_population.zip(@current_fitness)
    
    sorted_population_with_fitness = new_population_and_fitness.sort do |a, b| 
      a.last <=> b.last
    end

    n = @population_size / 2
    
    (@population_size / 2).times do
      elem, fitness = sorted_population_with_fitness.delete_at(0)
    	selected << elem
      selected_fitness << fitness
    end
    
    while(selected.size < @population_size )
      elem, fitness = sorted_population_with_fitness.delete_at(rand( sorted_population_with_fitness.size ))
      selected << elem
      selected_fitness << fitness
    end
    [selected, selected_fitness]
	end

	# Selecciona new_size individuos probabilisticamente segun el fitness
  # que aporta a la suma de fitness de toda la poblacion. Los individuos seleccionados
  # son eliminados de @population
	def survivor_roulette_wheel_selection
	  selected = Population.new
    selected_fitness = []
		sum = @current_fitness.inject(0.0){ |res, item| res + item }
		if sum == 0 
		  # there is no hypothesis in population which classify at least one example
		  # therefore, every hipothesis is equally "good" with respect to the others
		  probabilities = Array.new( @new_population_size , 1.0 / @new_population.size )
		else
    	probabilities = @current_fitness.map{ |i| i / sum }
  	end  
		
		#puts "probabilities of being selected: #{probabilities.inspect}" if $DEBUG
		
    @population_size.times do # new_size indica el numero de parejas que vamos a seleccionar
      # pick a random number and select the  h 
      # corresponding to that roulette-wheel area
     	r , inc = rand * probabilities.max, 0
      @new_population.each_index do |i| 
        if r < (inc += probabilities[i])
          selected << @new_population.delete_at(i)
          selected_fitness << @current_fitness.delete_at(i)
          probabilities.delete_at(i)
          break
        end
      end
  	end
    [selected, selected_fitness]
	end

  def crossover(parents)
    offspring = Population.new

    parents.each do |parent1, parent2|
      offspring.concat(parent1.crossover_with(parent2))
    end
    offspring
  end

	def add_alternative_on_population p
		mutated_population = p.sample( (0.01 * p.size).round )

		mutated_population.each do |hypothesis|
			random_attr = random_attr(hypothesis)
			random_attr[rand random_attr.length] = 1
		end
	end

	def drop_condition_on_population p
		mutated_population = p.sample( (0.6 * p.size).round )

		mutated_population.each do |hypothesis|
		
			random_attr = random_attr(hypothesis)
			random_attr.map!{ 1 }
						
		end
	end

	def mutate p
	  #puts "Selecting #{(@mutation_rate * @new_population.size).round} to mutate" if $DEBUG1
	
    mutated_population = p.sample( (@mutation_rate * p.size).round )

    mutated_population.each_with_index do |hypothesis, i|
      random_attr = random_attr(hypothesis)
      bit_index = rand(random_attr.size)
      # Muto un bit: si era 1 lo pongo en 0 y si era 0 lo pongo en 1
      random_attr[bit_index] = (random_attr[bit_index] - 1).abs
    end
    drop_condition_on_population p if @drop_condition
    add_alternative_on_population p if @add_alternative
	end

	#private

  def best_accuracy
    correct(@best_hypothesis).to_f / @training_examples.size.to_f
  end
	
	def calculate_fitness( p = @population )
	  #puts "Starting to calculate fitness of population" if $DEBUG
	  @current_fitness ||= Array.new p.size
    p.each_with_index do |hypothesis, index|
      # Hypothesis is of the form: [rule, rule, rule, ...]
      f = fitness(hypothesis)
      #puts "\tFitness of hypothesis is #{f} and of the best hypothesis is #{@best_fitness}" if $DEBUG
      @best_fitness, @best_hypothesis = f , hypothesis.dup if f > @best_fitness
			@current_fitness[index] = f
		end
		@current_fitness
	end
	
	# Recibe el individuo con el cual se va a evaluar los ejemplos de entrenamiento
  # fitness(h) = (correct(h))^2
	def fitness(hypothesis)
    [(correct(hypothesis)) ** 2 - (@penalized_fitness ? hypothesis.size : 0) , 1.0].max
	end
	
	# Devuelve el numero de ejemplos clasificados correctamente usando el conjunto
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
	  #puts "\t\tStarting to compare example #{example.inspect} against hypothesis" if $DEBUG
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
	  #puts "\t\t\tStarting to compare example againts rule #{rule.inspect}" if $DEBUG
	  example[(0..-2)].each_with_index do |attr_rule, index|
	    return false unless match_attr_rule? rule[index], attr_rule
	  end
    true
	end
	
	def match_attr_rule?(attr_rule_hypothesis, attr_rule_example)
	  #puts "\t\t\tComparing attr rule from hypothesis #{attr_rule_hypothesis.inspect} againts #{attr_rule_example}" if $DEBUG
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

  def assert(cond, msg)
    raise msg unless cond
  end
end
