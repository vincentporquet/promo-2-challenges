class Restaurant

  attr_accessor :clients, :orders, :managers, :deliverers

  def initialize(name, location, phone, menu)
    @clients = []
    @orders = []
    @deliverers = {}
    @managers = {}
    @menu = menu
  end

  def numbers_of_clients
    nbclients = @clients.length
  end

  def number_of_orders
    nborders = @orders.length
  end

end
