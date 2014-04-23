require_relative 'cookbook'

class Controller
  def initialize(file)
    # Here you should instantiate the Cookbook model with the file
    @file = file
    @cookbook = Cookbook.new(file)
  end

  def scrap(ingredient)
    @cookbook.scrap(ingredient)
    ingredient
  end

  def list
    @cookbook.all
  end

  def add(name, rating, cook_time, prep_time)
    @cookbook.create(name, rating, cook_time, prep_time)
  end

  def delete(index)
    @cookbook.destroy(index)
  end

  # TODO: Implement the methods to retrieve, add, and delete recipes through the model

end