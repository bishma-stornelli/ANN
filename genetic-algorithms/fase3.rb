#encoding: UTF-8
require 'rubygems'
require 'gruff'
require 'csv'

def process_configuration_line(line)
  result = {}
  /(?<number>\d+): (?<accuracy>\d+(?:\.\d+)?), (?<iterations>\d+), (?<mutation_rate>\d+(?:\.\d+)?), (?<crossover_rate>\d+(?:\.\d+)?), (?<drop_condition>(?:true|false)), (?<add_alternative>(?:true|false)), (?<penalized_fitness>(?:true|false)), (?<parent_selection_method>\w+), (?<survivor_selection_method>\w+), (?<time_running>\d+(\.\d+)?), (?<best_hypothesis>\[.*\])/ =~ line
  result[:number] = number.to_i
  result[:data] = {
    accuracy: accuracy.to_f,
    iterations: iterations.to_i,
    mutation_rate: mutation_rate.to_f,
    crossover_rate: crossover_rate.to_f,
    drop_condition: drop_condition,
    add_alternative: add_alternative,
    penalized_fitness: penalized_fitness,
    parent_selection_method: parent_selection_method,
    survivor_selection_method: survivor_selection_method,
    time_running: time_running.to_f
  }
  result
end

def index_of_best(conf)
  best_accuracy = 0
  best_index = 0
  conf.each do |number, data|
    if data[:accuracy] > best_accuracy
      best_accuracy = data[:accuracy]
      best_index = number
    end
  end
  best_index
end

def mean_accuracy(conf)
  sum = 0.0
  conf.each do |number, data|
    sum += data[:accuracy]
  end
  sum / conf.size
end

configurations = 7
offset = 20

configuration = {}
File.open("resumen", "r") do |f|
  while(line = f.gets)
    conf = process_configuration_line(line)
    configuration[conf[:number] / 10 + 1] ||= {}
    configuration[conf[:number] / 10 + 1][conf[:number]] = conf[:data]
  end
end

configurations.times do |i|
  configuration[i + offset][:best] = { 
    :index => index_of_best(configuration[i + offset]) ,
    :iterations => [] ,
    :accuracies => [] ,
    :mean_accuracy => mean_accuracy(configuration[i + offset]) * 100
  }
  filename = "outputs/#{configuration[i+offset][:best][:index]}"
  CSV.foreach(filename) do |row|
    configuration[i+offset][:best][:iterations] << row[0].to_i
    configuration[i+offset][:best][:accuracies] << row[1].to_f * 100
  end
  puts "Best for #{i + offset} = #{configuration[i + offset][:best][:accuracies].max}"
  puts "Mean for #{i + offset} = #{configuration[i + offset][:best][:mean_accuracy]}"
end

2.times do |i|
  g = Gruff::Line.new
  g.title = "Fase 3"
  g.replace_colors ['#ff0000', '#ff8888', 
                    '#00ff00', '#88ff88', 
                    '#0000ff', '#8888ff', 
                    '#ffff00', '#ffff88', 
                    '#ff00ff', '#ff88ff',
                    '#00ffff', '#88ffff']                  
  g.dot_radius = 0
  ( i == 1 ? 3 : 4).times do |j|
    puts "Corrida #{i*4 + j + offset}"
    g.data("C#{(i*4) + j + offset} best", configuration[(i*4) + j + offset][:best][:accuracies])
    g.data("C#{(i*4) + j + offset} mean", [configuration[(i*4) + j + offset][:best][:mean_accuracy]] * 100)
  end

  g.x_axis_label = "Iteraciones"
  g.y_axis_label = "Precisión (%%)"
  g.labels = {0 => "1", 24 => "25", 49 => "50", 74 => "75", 99 => "100"}

  g.write("fase3-#{i}.png")
end