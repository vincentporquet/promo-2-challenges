class Client

  attr_reader :id, :name
  attr_accessor :adress, :orders

  def initialize(id, name, adress, restaurant)
    @id = id
    @name = name
    @adress = adress
    @orders = []
    restaurant.clients << self
  end



end

