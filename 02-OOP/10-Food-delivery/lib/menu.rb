require_relative "meal"
require_relative "ingredient"

class Menu

  attr_accessor :ingredients, :meals, :list

  def initialize
    @ingredients = []
    @meals = []
    @list = []
  end

  def list
    #@list = (@ingredients << @meals).flatten
    @ingredients.each{ |item| @list << item }
    @meals.each{ |item| @list << item }

    @list
  end
end


# p menu.list #méthode list est passé sur l'instance Menu, stocké dans la variable menu

