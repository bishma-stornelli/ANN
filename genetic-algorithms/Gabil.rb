class Gabil

	attr_reader :population_size, :population, :inputs, :outputs, :fitness, :fatherSelection1, :fatherSelection2, :survivorSelection1, :survivorSelection2, :training_population

	attr_accessor :fitness_threshold, :n_features, :mutation_rate, :crossover_rate

	def initialize(fitness_threshold, n_features, population_size, mutation_rate = 0.001, crossover_rate = 0.6)
		@population_size = population_size
		@population = []
		@inputs = []
		@outputs = []
		@fitness = []
		@fatherSelection1 = []
		@fatherSelection2 = []
		@survivorSelection1 = []
		@survivorSelection2 = []
		@fitness_threshold = fitness_threshold
		@n_features = n_features
		@mutation_rate = mutation_rate
		@crossover_rate = crossover_rate
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

	def load_examples(outputs, file_path, separator = ",")

		input = []
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
				input << tmp
				a2 << tmp[1].to_f
				a3 << tmp[2].to_f
				a8 << tmp[7].to_f
				a11 << tmp[10].to_f
				a14 << tmp[13].to_f
				a15 << tmp[14].to_f
			    @outputs << tmp[@n_features - 1]
			end
		end

		input.each_with_index do |i, n|

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

end
