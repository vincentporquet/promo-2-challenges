class RestoManager


  def initialize(restaurant)
    login(restaurant)
  end

  def login(restaurant)

    puts "Name?"
    name = gets.chomp
    puts "Password?"
    password = gets.chomp

    if restaurant.deliverers[name] && restaurant.deliverers[name].password == password
      Interface.new(name, restaurant)
    elsif restaurant.managers[name] && restaurant.managers[name].password == password
      InterfaceMaster.new(name, restaurant)
    else
      puts "Wrong name or password! Try again bouffon!"
      login(restaurant)
    end

  end

end