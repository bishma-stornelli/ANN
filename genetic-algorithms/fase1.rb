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
    time_running: time_running.to_f,
    hypothesis: best_hypothesis
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

configuration = {1 => {}, 2 => {}, 3 => {}, 4 => {}}
File.open("resumen", "r") do |f|
  20.times do |i|
    line = f.gets
    conf = process_configuration_line(line)
    configuration[conf[:number] / 10 + 1][conf[:number]] = conf[:data]
  end
end

2.times do |i|
  configuration[i + 1][:best] = { 
    :index => index_of_best(configuration[i + 1]) ,
    :iterations => [] ,
    :accuracies => []
  }
  filename = "outputs/#{configuration[i+1][:best][:index]}"
  CSV.foreach(filename) do |row|
    configuration[i+1][:best][:iterations] << row[0].to_i
    configuration[i+1][:best][:accuracies] << row[1].to_f
  end
end

g = Gruff::Line.new
g.title = "Fase 1" 

g.data("Configuración 1", configuration[1][:best][:accuracies])
g.data("Configuración 2", configuration[2][:best][:accuracies])
#g.data("Configuración 3", configuration[3][:best][:accuracies])
#g.data("Configuración 4", configuration[4][:best][:accuracies])
g.x_axis_label = "Iteraciones"
g.y_axis_label = "Precisión"
g.labels = {0 => "1", 24 => "25", 49 => "50", 74 => "75", 99 => "100"}

g.write('fase1.png')