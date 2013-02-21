# Uso de la clase:
#   1. l = Learner.new n_features, n_hidden, learning_rate
#   2. l.load_training_examples(file_path, output_map)
#   3. (Opcional) l.load_testing_examples(file_path, output_map) 
#   4. (Opcional) (Warning: override testing examples) l.split_examples(percentage)
#   5. l.train
#   6. l.error(l.testing_examples, l.testing_outputs)

class Learner
  
  # Detalles de implementacion:
  #   n_features (Fixnum): numero de neuronas de entrada
  #   n_hidden (Fixnum): numero de neuronas ocultas
  #   learning_rate (Float): tasa de aprendizaje
  #   weights (Array[Array[Float]]): pesos de la red. weights[i][j] contiene el 
  #     peso desde la neurona j a la i (NOTE QUE ESTA INVERSO)
  #   training_examples (Array[Float]): conjunto de datos usados como entrenamiento
  #   testing_examples (Array[Float]): conjunto de datos usado como prueba
  #   training_outputs (Array[Fixnum]): conjunto de salidas de entrenamiento. 
  #     Posicion i corresponde a salida de training_examples[i]
  #   testing_outputs (Array[Fixnum]): conjunto de salidas de prueba. 
  #     Posicion i corresponde a salida de testing_examples[i]
  #   input_neurons (Array[Fixnum]): vector que contiene los ids de las neuronas
  #     de entrada (e.g.: [0, 1, 2, 3] para n_features = 4
  #   hidden_neurons (Array[Fixnum]): vector que contiene los ids de las neuronas
  #     en la capa oculta (e.g.: [4, 5, 6] para n_features = 4 y n_hidden = 3)
  #   output_neurons (Array[Fixnum]): vector que contiene los ids de las neuronas
  #     en la capa de salida (por ahora solo es una neurona de salida y su valor sera [n_features + n_hidden])
  attr_reader :training_examples, :training_outputs,
    :testing_examples, :testing_outputs,
    :n_features, :n_hidden, :weights
  attr_accessor :learning_rate, :max_iterations, :error_tolerance
  def initialize(n_features, n_hidden, learning_rate = 0.1, max_iterations = 50000, error_tolerance = 0.01)
    @n_features = n_features
    @n_hidden = n_hidden
    @learning_rate = learning_rate
    @weights = []
    @training_examples = []
    @testing_examples = []
    @raw_examples = []
    @training_outputs = []
    @testing_outputs = []
    @raw_outputs = []
    @input_neurons = Array.new(n_features){ |i| i }
    @hidden_neurons = Array.new(n_hidden){ |i| n_features + i }
    @output_neurons = [n_features + n_hidden]
    @max_iterations = max_iterations
    @error_tolerance = error_tolerance
  end

  # Split the training_examples in 2 sets, storing raw_examples.size * percentage
  # in training_examples and the rest in testing_examples
  # The split might be done in three ways (pick one):
  #    randomly (medium good)
  #    first raw_examples.size * percentage elements (poor)
  #    randomly and uniformly (half classified 0 and half classified 1) (good)
  # param percentage is a float between 0 and 1
  def split_examples(percentage)
  end

  
  def train
    weights = initialize_weights
    iteration = 0
    while error(training_examples, training_outputs) > 0.01 || iteration < max_iterations do
      training_examples.each_with_index do |ei, i|
        lambdas = Array.new
        
        o = evaluate(ei)
        for k in output_neurons do
          lambdas[k] = o[k] * (1 - o[k] ) * (outputs[i] - o[k] )        
        end 

        for h in hidden_neurons do          
          lambdas[h] = o[h] * (1 - o[h]) * output_neurons.sum {|k| w[k][h] * lambda[k]}
        end
        
        update_weights(lambdas)
      end
      iteration += 1
    end
  end

  # Evaluate the input example with the current weights and
  # returns an array such that o[k] is the output for neuron k 
  def evaluate(example)
  end

  # Calculate the error in examples with respect to the expected
  # outputs outputs
  def error(examples, outputs)
    outputs.each_with_index.inject(0) { |acc, (output, index)| acc + (output - evaluate(examples[index]))**2 } / outputs.size
  end  
  
  def load_training_examples(file_path, output_map = {})
    load_examples(@training_examples, @training_outputs, file_path, output_map)
  end
  
  def load_testing_examples(file_path, output_map = {})
    load_examples(@testing_examples, @testing_outputs, file_path, output_map)
  end
  
  private
  
  # Load the examples from the file file_path taking the first n_features 
  # (from 0 to n_features) columns as features and 
  # the n_features column as the outputs while mapping them
  # using the hash output_map (which is in the form of
  # {"1" => "1", "2" => "0"} for example).
  # It stores the inputs in the inputs variable and the outputs in the 
  # outputs variable (they must be initialized before calling this method).
  def load_examples(inputs, outputs, file_path, output_map = {})
  
  end
  
  # Update weights with the differences in lambdas
  def update_weights(lambdas)
  end  
  
  # Initialize the weights of the network randomly
  # returns an array such that w[i][j] is the weight from neuron j to i
  def initialize_weights
    w = Array.new( n_features + n_hidden + 1 , [] )
    input_neurons.each do |i|
      hidden_neurons.each do |h|
        w[h][i] = rand
      end
    end
    hidden_neurons.each do |h|
      output_neurons.each do |o|
        w[o][h] = rand
      end
    end
    w
  end

end
