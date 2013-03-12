require './gabil'
require './population'
require './hypothesis'
require './rule'

@size_of_attr = [2,3,3,4,3,14, 9, 3, 2, 2, 3, 2, 3, 3, 3, 1]

def sturges(x)
    return (1 + 3.322*Math.log10(x)).round
end

def load_examples(file_path, separator = ",")

    inputs = []
    result = Population.new
    aux = []
    a2 = []
    a3 = []
    a8 = []
    a11 = []
    a14 = []
    a15 = []

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

    sturges = sturges(inputs.length)

    inputs.each_with_index do |i, n|

      aux = Hypothesis.new
      tmp = []

      if i[0] == "?"
      else
        aux << case i[0]
          when "a" then [1,0]
          else [0,1]
        end
      end

      h = (a2.max - a2.min)/sturges
      p = a2.min
      j = 0

      if i[1] == "?"
      else
        sturges.times do
          if i[1].to_f >= p + h*j && i[1].to_f < p + h*(j+1)
            tmp = Array.new(sturges - 1, 0)
            tmp.insert(j, 1)
            aux << tmp
            break
          end
          j += 1
        end
      end

      h = (a3.max - a3.min)/sturges
      p = a3.min
      j = 0
      tmp = []

      if i[2] == "?"
      else
        sturges.times do
          if i[2].to_f >= p + h*j && i[2].to_f < p + h*(j+1)
            tmp = Array.new(sturges - 1, 0)
            tmp.insert(j, 1)
            aux << tmp
            break
          end
          j += 1
        end
      end

      if i[3] == "?"
      else
        aux << case i[3]
          when "u" then [1,0,0,0]
          when "y" then [0,1,0,0]
          when "l" then [0,0,1,0]
          else [0,0,0,1]
        end
      end

      if i[4] == "?"
      else
        aux << case i[4]
          when "g" then [1,0,0]
          when "p" then [0,1,0]
          else [0,0,1]
        end
      end

      if i[5] == "?"
      else
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
      end

      if i[6] == "?"
      else
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
      end

      h = (a8.max - a8.min)/sturges
      p = a8.min
      j = 0
      tmp = []

      if i[7] == "?"
      else
        sturges.times do
          if i[7].to_f >= p + h*j && i[7].to_f < p + h*(j+1)
            tmp = Array.new(sturges - 1, 0)
            tmp.insert(j, 1)
            aux << tmp
            break
          end
          j += 1
        end
      end

      if i[8] == "?"
      else
        aux << case i[8]
          when "t" then [1,0]
          else [0,1]
        end
      end

      if i[9] == "?"
      else
        aux << case i[9]
          when "f" then [1,0]
          else [0,1]
        end
      end

      h = (a11.max - a11.min)/sturges
      p = a11.min
      j = 0
      tmp = []
      if i[10] == "?"
      else
        sturges.times do
          if i[10].to_f >= p + h*j && i[10].to_f < p + h*(j+1)
            tmp = Array.new(sturges - 1, 0)
            tmp.insert(j, 1)
            aux << tmp
            break
          end
          j += 1
        end
      end

      if i[11] == "?"
      else
        aux << case i[11]
          when "t" then [1,0]
          else [0,1]
        end
      end

      if i[12] == "?"
      else
        aux << case i[12]
          when "g" then [1,0,0]
          when "p" then [0,1,0]
          else [0,0,1]
        end
      end

      h = (a14.max - a14.min)/sturges
      p = a14.min
      j = 0
      tmp = []

      if i[13] == "?"
      else
        sturges.times do
          if i[13].to_f >= p + h*j && i[13].to_f < p + h*(j+1)
            tmp = Array.new(sturges - 1, 0)
            tmp.insert(j, 1)
            aux << tmp
            break
          end
          j += 1
        end
      end

      h = (a15.max - a15.min)/sturges
      p = a15.min
      j = 0
      tmp = []

      if i[14] == "?"
      else
        sturges.times do
          if i[14].to_f >= p + h*j && i[14].to_f < p + h*(j+1)
            tmp = Array.new(sturges - 1, 0)
            tmp.insert(j, 1)
            aux << tmp
            break
          end
          j += 1
        end
      end

      aux << (i[15] =~ /\+/ ? [1] : [0])
      result << aux
    end
    result
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
  rule = Rule.new
  @size_of_attr.each do |size|
    rule << generate_random_attribute_rule(size)
  end
  rule
end

# Genera un arreglo que contiene size reglas
def generate_random_hypothesis( size )
  hypothesis = Hypothesis.new
  size.times do
    hypothesis << generate_random_rule
  end
  hypothesis
end

def generate_random_population( size )
  population = Population.new
  size.times do
    population << generate_random_hypothesis( rand(10) + 1 )
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
  
  examples = load_examples("crx.data")
  population = generate_random_population( population_size )
  gabil = Gabil.new(population)
  
  while gabil.best_fitness < fitness_threshold
    gabil.evolve
  end

end
=end
