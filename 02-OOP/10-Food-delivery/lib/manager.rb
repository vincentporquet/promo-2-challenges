class Manager

  attr_reader :password, :name

  def initialize(name, password, restaurant)
    @name = name
    @password = password
    restaurant.managers[name] = self
  end

end