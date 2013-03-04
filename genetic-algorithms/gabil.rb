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

	def fatherSelection1(x, r)

		result = []

		sum = x.inject(0){|res,item| res + item}

		for k in inputs do
			@fatherSelection1[k] = @fitness[k].to_f/sum
		end

		propability = (1.0 - r.to_f)/@population

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
