class Deliverer

  attr_reader :name, :password
  attr_accessor :orders

  def initialize(name, password, restaurant)
    @name = name
    @password = password
    @orders = []
    restaurant.deliverers[name] = self
  end

end