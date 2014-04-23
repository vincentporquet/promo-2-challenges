class Ingredient

  attr_reader :name, :calories
  attr_accessor :price

  def initialize(name, price, calories, menu)
    @name = name
    @price = price
    @calories = calories
    menu.ingredients << self #self fait référence à l'objet en cours de création
  end

end

