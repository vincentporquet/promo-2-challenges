class Interface

  TASKS = {
    view: "- View my orders [view]",
    complete:  "- Complete orders [complete]",
    exit:  "- Log out [exit]",
  }

  def initialize(name, restaurant)
    @running = true
    find_employe(name, restaurant)
    display(name)
  end

  def find_employe(name, restaurant)
    @deliverer = restaurant.deliverers[name]
  end

  def view
    @deliverer.orders.each do |order|
      puts "\n"
      print "id- #{order.id} : #{order.delivered}, #{order.client.name}, #{order.client.adress}, #{order.price}$, "
      puts "#{order.items.map { |item| item.name }.join(", ")}"
      puts "\n"
    end
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







