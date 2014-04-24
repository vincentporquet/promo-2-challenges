require_relative 'lib/client'
require_relative 'lib/deliverer'
require_relative 'lib/ingredient'
require_relative 'lib/manager'
require_relative 'lib/meal'
require_relative 'lib/menu'
require_relative 'lib/order'
require_relative 'lib/restaurant'
require_relative 'lib/interface'
require_relative 'lib/restomanager'
require_relative 'lib/interface_master'

menu = Menu.new
restaurant = Restaurant.new("chez Momo", "2 rue de ta soeur", "0231247895", menu)
JJ = Client.new("JJ", "8 rue dans ton cul", restaurant)
polo = Deliverer.new("Polo", "password", restaurant)
frites = Ingredient.new("frites", 3, 400, menu)
tripes = Ingredient.new("tripes à la mode de Caen", 14, 500, menu)
biere = Ingredient.new("bière", 6, 300, menu)
courbis = Manager.new("JMM", "password", restaurant)
lunch_meal = Meal.new("lunch meal", [frites, tripes, biere], menu)

p menu.ingredients

p menu.meals

p menu.list
# order = Order.new("Polo", [lunch_meal, frites], "JJ", restaurant)

#resto_manager = RestoManager.new(restaurant)
