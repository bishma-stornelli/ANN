class Leaner
  
  attr_accessor :n_features, :n_hidden, :learning_rate, :weights,
    :train_examples, :test_examples, :raw_examples,
    :train_outputs, :test_outputs, :raw_outputs
  def initialize(n_features, n_hidden, learning_rate)
    @n_features = n_features
    @n_hidden = n_hidden
    @learning_rate = learning_rate
    @weights = []
    @train_examples = []
    @test_examples = []
    @raw_examples = []
    @train_outputs = []
    @test_outputs = []
    @raw_outputs = []
  end

  # Load raw_examples from file_path taking the first n_features 
  # (from 0 to n_features) columns as features and 
  # the n_features column as the raw_outputs while mapping them
  # using the hash output_map (which is in the form of
  # {"1" => "1", "2" => "0"} for example).
  def load_examples(file_path, output_map)
  end

  # Split raw_examples into train_examples and test_examples
  # where train_examples.size == raw_examples.size * percentage
  # and test_examples.size == raw_examples.size - train_examples.size
  # The split might be done in three ways (pick one):
  #    randomly (medium good)
  #    first raw_examples.size * percentage elements (poor)
  #    randomly and uniformly (half classified 0 and half classified 1) (good)
  # param percentage is a float between 0 and 1
  def split_examples(percentage)
  end

  
  def train
  end

  # Evaluate the input example and
  # returns the classification with the current trained weights
  def evaluate(example)
  end

  # Calculate the error in examples with respect to the expected
  # outputs outputs
  def error(examples, outputs)
  end
  
  # Update weights with the differences in lambdas
  def update_weights(lambdas)
  end

end