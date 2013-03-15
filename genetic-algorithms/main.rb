require './gabil'
require './population'
require './hypothesis'
require './rule'
require 'benchmark'

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
        aux << Array.new(@size_of_attr[0], 1)
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
        aux << Array.new(@size_of_attr[1], 1)
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
        aux << Array.new(@size_of_attr[2], 1)
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
        aux << Array.new(@size_of_attr[3], 1)
      else
        aux << case i[3]
          when "u" then [1,0,0,0]
          when "y" then [0,1,0,0]
          when "l" then [0,0,1,0]
          else [0,0,0,1]
        end
      end

      if i[4] == "?"
        aux << Array.new(@size_of_attr[4], 1)
      else
        aux << case i[4]
          when "g" then [1,0,0]
          when "p" then [0,1,0]
          else [0,0,1]
        end
      end

      if i[5] == "?"
        aux << Array.new(@size_of_attr[5], 1)
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
        aux << Array.new(@size_of_attr[6], 1)
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
        aux << Array.new(@size_of_attr[7], 1)
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
        aux << Array.new(@size_of_attr[8], 1)
      else
        aux << case i[8]
          when "t" then [1,0]
          else [0,1]
        end
      end

      if i[9] == "?"
        aux << Array.new(@size_of_attr[9], 1)
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
        aux << Array.new(@size_of_attr[10], 1)
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
        aux << Array.new(@size_of_attr[11], 1)
      else
        aux << case i[11]
          when "t" then [1,0]
          else [0,1]
        end
      end

      if i[12] == "?"
        aux << Array.new(@size_of_attr[12], 1)
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
        aux << Array.new(@size_of_attr[13], 1)
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
        aux << Array.new(@size_of_attr[14], 1)
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
    population << generate_random_hypothesis( rand(15) + 1 )
  end
  population
end

def split_population_training_test( percentage, training )
  n = (training.length*percentage).round
  test = []

  n.times do
    i = rand(training.length)
    test << training.delete_at(i)
  end

  test
end

##################################################################################
####### ENTRENAR HASTA QUE SE CLASIFIQUEN SUFICIENTES EJEMPLOS CORRECTAMENTE #####
##################################################################################

def new_run(run, training_data, options={})
  gabil = nil
  bm = Benchmark.measure do
    population = generate_random_population(100)
    gabil = Gabil.new population, training_data, options
    log_file = File.new("outputs/#{run}", "w")
    log_file.puts("#{gabil.current_iteration},#{gabil.best_accuracy}")
    init_time = Time.now
    time_elapsed = Time.now - init_time
    while gabil.best_accuracy < 0.95 && gabil.current_iteration < 100 && time_elapsed < 300
      puts "Evolving run #{run}, fitness = #{gabil.best_fitness}, iteration = #{gabil.current_iteration}"
      gabil.evolve
      log_file.puts("#{gabil.current_iteration},#{gabil.best_accuracy}")
      time_elapsed = Time.now - init_time
    end
    log_file.close
  end

  File.open("resumen", "a") do |f|
    f.puts("#{run}: #{gabil.best_accuracy}, #{gabil.current_iteration}, #{gabil.mutation_rate}, #{gabil.crossover_rate}, #{gabil.drop_condition}, #{gabil.add_alternative}, #{gabil.penalized_fitness}, #{gabil.parent_selection_method}, #{gabil.survivor_selection_method}, #{bm.real}, #{gabil.best_hypothesis.inspect}" )
  end
end

begin
  training_data = load_examples('crx.data')
  testing_data = split_population_training_test(0.7, training_data)

  puts training_data.count{|e| e.last == [1]}, training_data.count{|e| e.last == [0]}

  run = 0

  # 10.times do |i|
  #   new_run(i, training_data, 
  #     :parent_selection_method => :roulette_wheel_selection,
  #     :survivor_selection_method => :elitist_selection
  #   )
  # end
  #run += 10
  #run += 10.times do |i|
  #   new_run(i + 10, training_data, 
  #     :parent_selection_method => :roulette_wheel_selection,
  #     :survivor_selection_method => :survivor_roulette_wheel_selection
  #   )
  # end
  #run += 10

  # 10.times do |i|
  #   new_run(i + run, training_data, 
  #     :parent_selection_method => :tournament_selection,
  #     :survivor_selection_method => :elitist_selection
  #   )
  # end
  #run += 10

  # 10.times do |i|
  #   new_run(i + run, training_data, 
  #     :parent_selection_method => :tournament_selection,
  #     :survivor_selection_method => :survivor_roulette_wheel_selection
  #   )
  # end
  #run += 10

  # 0.001, 0.4 => 40
  # 0.001, 0.6 => 50
  # 0.001, 0.8 => 60
  # 0.001, 1.0 => 70

  # 0.01, 0.4 => 80
  # 0.01, 0.6 => 90
  # 0.01, 0.8 => 100
  # 0.01, 1.0 => 110

  # 0.1, 0.4 => 120
  # 0.1, 0.8 => 130
  # 0.1, 1.0 => 140

  # 0.2, 0.4 => 150
  # 0.2, 0.6 => 160
  # 0.2, 0.8 => 170
  # 0.2, 1.0 => 180

  # Run 40 - 79
  run = 120
  [0.1].each do |mutation_rate|
    [0.4, 0.6, 0.8, 1.0].each do |crossover_rate|
      next if mutation_rate == 0.1 && crossover_rate == 0.6 # Configuracion por defecto, ya se eligio de arriba
      10.times do
        new_run(run, training_data, 
        :parent_selection_method => :tournament_selection,
        :survivor_selection_method => :survivor_roulette_wheel_selection,
        :mutation_rate => mutation_rate,
        :crossover_rate => crossover_rate
        )
        run += 1
      end
    end
  end # Comentar para evaluar fase 3
  # run += 160 # Descomentar para evaluar fase 3
 
  # [false, true].each do |drop_condition|
  #   [false, true].each do |add_alternative|
  #     [false, true].each do |penalized_fitness|
  #       next unless drop_condition || add_alternative || penalized_fitness
  #       new_run(run, training_data, 
  #         :parent_selection_method => :tournament_selection,
  #         :survivor_selection_method => :survivor_roulette_wheel_selection,
  #         :mutation_rate => mutation_rate,
  #         :crossover_rate => crossover_rate
  #       )
  #       run += 1
  #     end
  #   end
  # end
end
