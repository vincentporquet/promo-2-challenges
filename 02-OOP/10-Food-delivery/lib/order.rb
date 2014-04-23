class Order

  attr_reader :date, :items, :client, :delivered

  def initialize(deliverer_name, items, client_name, restaurant)
    @date = Time.now
    @items = items
    @delivered = "undelivered"
    @price = price
    order_registration(restaurant, client_name, deliverer_name)
  end

  def price
    @items.map{|item| item.price}.reduce(:+)
  end

  def delivery(status)
    if status == "ok"
      @delivered = "delivered"
    else status == "cancel"
      @delivered = "canceled"
    end
  end

  def order_registration(restaurant, client_name, deliverer_name)
    restaurant.orders << self
    @client = restaurant.clients.find{ |client| client.name == client_name }
    @deliverer = restaurant.deliverers[deliverer_name]
    @client.orders << self
    @deliverer.orders << self
  end

end



