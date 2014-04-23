class RestoManager


  def initialize(restaurant)
    login(restaurant)
  end


  def login(restaurant)

    puts "Name?"
    name = gets.chomp
    puts "Password?"
    password = gets.chomp

    if restaurant.deliverers[name].password == password
      Interface.new(name, restaurant)
    elsif restaurant.managers[name].password == password
      InterfaceMaster.new(name, restaurant)
    else
      puts "Wrong name or password! Try again bouffon!"
      login(restaurant)
    end

  end

end



class Interface

  TASKS = {
    view: "- View my orders [view]",
    complete:  "- Complete orders [complete]",
    exit:  "- Log out [exit]",
  }

  def initialize(name, restaurant)
    @running = true
    find_employe(name, restaurant)
    display
  end

  def find_employe(name, restaurant)
    @deliverer = restaurant.deliverers[name]
  end

  def view
    @deliverer.orders.each do |order|
      puts "\n"
      puts "#{order.delivered}, #{order.client.name}, #{order.client.adress}, #{order.items.each{|item| puts item.name}}, #{order.price}$"
      puts "\n"
    end
  end

  def complete
    puts "What order do you wanna upgrade?"
    view
    search = gets.chomp
    order = @deliverer.orders.find{|order| order == search}
    order.delivered("ok")
    puts "#{order} was delivered, go back to work!"
  end

  def exit
    @running = false
  end

  def display
    puts "\n"
    puts "-- Hi #{@deliverer.name}! Welcome to RestoManager --"

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






