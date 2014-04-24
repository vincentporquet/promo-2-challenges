class InterfaceMaster

  TASKS = {
    clients: "- List customers [clients]",
    add: "- Add a customer[add]",
    view: "- View my orders [view]",
    order: "- Add a new order [order]",
    complete:  "- Complete orders [complete]",
    list_empl: "- List deliverers",
    exit:  "- Log out [exit]",
  }


  def initialize(name, restaurant)
    @running = true
    @restaurant = restaurant
    find_employe(name, restaurant)
    display(name)
    @menu = restaurant.menu
  end

  def find_employe(name, restaurant)
    @manager = restaurant.managers[name]
  end

  def clients
    @restaurant.clients.map {|client| print "#{client.id}- #{client.name}, #{client.adress}."}.join(", ")
  end

  def add
    puts "Please enter the name"
    name = gets.chomp
    puts "Please enter the adress"
    adress = gets.chomp
    Client.new(name, adress, @restaurant)
  end

  def view
    @restaurant.orders.each do |order|
      puts "\n"
      print "id- #{order.id} : #{order.delivered}, #{order.client.name}, #{order.client.adress}, #{order.price}$, "
      puts "#{order.items.map { |item| item.name }.join(", ")}"
      puts "\n"
    end
  end

  def order
    puts "Please enter the name"
    search = gets.chomp
    client = @restaurant.clients.find{ |client| client.name == search }
    client = add if client.nil?

    deliverer = set_deliverer
    items = set_items
    Order.new(deliverer, items, client, @restaurant)
  end

  def set_deliverer
    puts "enter deliverer name?"
    deliverer = gets.chomp
  end

  def set_items
    puts "enter items"
    items = []
    item = gets.chomp
    while item != "exit"
      items << item
      item = gets.chomp
    end
    items.map!{|item| @restaurant.menu.list.find{ |food| puts food.name puts item}}
  end

  def complete
    puts "What order do you wanna upgrade?"
    view
    puts "id of the order you wanna upgrade buddy?"
    search = gets.chomp
    order = @deliverer.orders.find{|order| order.id == search}
    order.delivery("ok")
    puts "#{order} was delivered, go back to work!"
  end

  def exit
    @running = false
  end

  def display(name)
    puts "\n"
    puts "-- Hi #{name}! Welcome to RestoManager --"

    while @running
      print "\n"

      display_tasks
      dispatch(user_input)

      print "\n"
    end
  end

  def user_input
    print "> "
    input = gets.chomp.to_sym

    unless TASKS.keys.include?(input)
      puts "Invalid input, please retry."
      self.user_input
    end

    input
  end

  def display_tasks
    puts "What do you want to do? \n"
    puts TASKS.values
  end

  def dispatch(task)
    self.send(task.to_sym)
  end
end

