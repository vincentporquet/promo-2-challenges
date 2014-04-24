class Order

  attr_reader :date, :items, :client, :delivered, :id

  def initialize(deliverer_name, items, client, restaurant)
    @date = Time.now
    @items = items
    @delivered = "undelivered"
    @price = price
    @client = client
    order_registration(restaurant, client, deliverer_name)
    generate_id
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

  def order_registration(restaurant, client, deliverer_name)
    restaurant.orders << self
    @deliverer = restaurant.deliverers[deliverer_name]
    @client.orders << self
    @deliverer.orders << self
  end

  def generate_id
    @id = @deliverer.orders.index(self).to_s
  end

end



