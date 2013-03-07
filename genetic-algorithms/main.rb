require './gabil'

@size_of_attr = [2,3,3,4,3,14, 9, 3, 2, 2, 3, 2, 3, 3, 3, 1]

def load_examples(file_path, separator = ",")
	inputs = []
	population = []
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
			tmp.each_with_index do |e, i|
			  tmp[i] = e.to_f if [1,2,7,10,13,14].include? i
			end
			inputs << tmp
			a2 << tmp[1].to_f
			a3 << tmp[2].to_f
			a8 << tmp[7].to_f
			a11 << tmp[10].to_f
			a14 << tmp[13].to_f
			a15 << tmp[14].to_f
		end
	end

	inputs.each_with_index do |i, n|

		aux = []

		aux << case i[0]
			when "a" then [1, 0]
			else [0, 1]
		end

		h = (a2.max - a2.min)/3

		if i[1] >= a2.min && i[1] < h
			aux << [1,0,0]
		elsif i[1] >= h && i[1] < h*2
			aux << [0,1,0]
		else
			aux << [0,0,1]
		end

		h = (a3.max - a3.min) / 3

		if i[2] >= a3.min && i[2] < h
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
			when "v"  then [1,0,0,0,0,0,0,0,0]
			when "h"  then [0,1,0,0,0,0,0,0,0]
			when "bb" then [0,0,1,0,0,0,0,0,0]
			when "j"  then [0,0,0,1,0,0,0,0,0]
			when "n"  then [0,0,0,0,1,0,0,0,0]
			when "z"  then [0,0,0,0,0,1,0,0,0]
			when "dd" then [0,0,0,0,0,0,1,0,0]
			when "ff" then [0,0,0,0,0,0,0,1,0]
			else           [0,0,0,0,0,0,0,0,1]
		end

		h = (a8.max - a8.min) / 3

		if i[7] >= a8.min && i[7] < h
			aux << [1,0,0]
		elsif i[7] >= h && i[7] < h*2
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

		h = (a11.max - a11.min) / 3

		if i[10] >= a11.min && i[10] < h
			aux << [1,0,0]
		elsif i[10] >= h && i[10] < h*2
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

		h = (a14.max - a14.min) / 3

		if i[13] >= a14.min && i[13] < h
			aux << [1,0,0]
		elsif i[13] >= h && i[13] < h*2
			aux << [0,1,0]
		else
			aux << [0,0,1]
		end

		h = (a15.max - a15.min) / 3

		if i[14] >= a15.min && i[14] < h
			aux << [1,0,0]
		elsif i[14] >= h && i[14] < h*2
			aux << [0,1,0]
		else
			aux << [0,0,1]
		end
		#puts i.inspect
		aux << (i[15] =~ /\+/ ? [1] : [0])
    #puts "Insertando #{aux} en la poblacion"
		population << aux
		#sleep 5
	end
	
	population
end

#############################################################################
########## FUNCIONES PARA GENERAR LA POBLACION INICIAL ######################
#############################################################################

# Genera un arreglo de tamano size cuyos elementos son enteros aleatorios entre [0,1] 
def generate_random_attribute_rule( size )
  r = []
  size.times { r << rand.round }
  r
end

# Genera una regla con 16 atributos. Cada atributo tiene un tamano de acuerdo a 
# size_of_attr definido al principio del archivo
def generate_random_rule
  rule = []
  @size_of_attr.each do |size|
    rule << generate_random_attribute_rule(size)
  end
  rule
end

# Genera un arreglo que contiene size reglas
def generate_random_hypothesis( size )
  hypothesis = []
  size.times do
    hypothesis << generate_random_rule
  end
  hypothesis
end

def generate_random_population( size )
  population = []
  size.times do
    population << generate_random_hypothesis( 1 )
  end
  population
end

##################################################################################
####### ENTRENAR HASTA QUE SE CLASIFIQUEN SUFICIENTES EJEMPLOS CORRECTAMENTE #####
##################################################################################

=begin
begin

  [:roulette_wheel_selection, :elitist_selection].each do |selection_method|
    # Seleccionar mejor configuracion del metodo de seleccion
  end
  
  [0.001, 0.005, 0.01, 0.05, 0.1, 0.2].each do |mutation_rate|
    [0.4, 0.6, 0.8, 1.0].each do |crossover_rate|
      next if mutation_rate == 0.001 && crossover_rate == 0.6 # Configuracion por defecto, ya se eligio de arriba
      # Seleccionar mejor par (mutation_rate, crossover_rate) usando el mejor metodo de seleccion
    end
  end
  
  [false, true].each do |drop_condition|
    [false, true].each do |add_alternative|
      next unless drop_condition || add_alternative # both false is default configuration
      # Ver si drop_condition o add_alternative logran mejorar el resultado
    end
  end
  
  population = generate_random_population( population_size )
  gabil = Gabil.new(population)
  
  while gabil.best_fitness < fitness_threshold
    gabil.evolve
  end

end
=end
