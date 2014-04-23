require_relative "ingredient"

class Meal

  attr_reader :name, :calories, :ingredients
  attr_accessor :price

  def initialize(name, ingredients, menu)
    @name = name
    @ingredients = ingredients
    @calories = ingredients.map { |ingredient| ingredient.calories }.reduce(:+)
    @price = ingredients.map { |ingredient| ingredient.price }.reduce(:+)*0.9
    menu.meals << self
  end

end

