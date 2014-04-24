class Client

  attr_reader :id, :name
  attr_accessor :adress, :orders

  def initialize(name, adress, restaurant)
    @name = name
    @adress = adress
    @orders = []
    restaurant.clients << self
    generate_id(restaurant)
  end

  def generate_id(restaurant)
    @id = restaurant.clients.index(self).to_s #@deliverer.orders.index(self).to_s
  end


end

