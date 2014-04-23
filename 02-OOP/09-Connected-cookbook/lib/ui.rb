require_relative 'cookbook'
require_relative 'controller'


class UI
  TASKS = {
    scrap: "- Scrap Marmiton [scrap]",
    list: "- List all recipes [list]",
    add:  "- Add a new recipe [add]",
    del:  "- Delete a recipe [del]",
    exit: "- Exit [exit]"
  }

  def initialize(controller)
    @controller = controller
    @running = true
  end

  def list
    # TODO: call the appropriate controller method with the proper argument(s)
    # TODO: format and display the retrieved data in a numbered list
    puts "Your recipes : "
    @controller.list.each_with_index do |recipe, index|
      puts "#{index + 1} : #{recipe.name} (#{recipe.prep_time} min)"
    end

  end

  def scrap
    puts "which ingredient ?"
    ingredient = gets.chomp
    @controller.scrap(ingredient)
    puts "You've just scraped #{ingredient} !"
  end

  def add
    # TODO: ask the user a recipe name
    puts 'Enter the name of your new recipe'
    name = gets.chomp

    puts 'Enter the rating of your new recipe'
    rating = gets.chomp.to_i

    puts 'Enter the cook time of your new recipe'
    cook_time = gets.chomp.to_i

    puts 'Enter the prep time of your new recipe'
    prep_time = gets.chomp.to_i

    @controller.add(name, rating, cook_time, prep_time)

    # TODO: call the appropriate controller method with the proper argument(s)
  end



  def del
    # TODO: ask the user a recipe index
    puts 'Enter the index of the recipe you want to delete'
    index = gets.chomp.to_i
    @controller.delete(index - 1)
    # TODO: call the appropriate controller method with the proper argument(s)
  end

  def exit
    # TODO: exit the program
    @running = false
    # Hint: Take a look at the display method !
  end

  def user_input
    # TODO: Get the user input and return it
    gets.chomp
    # [OPTIONAL] You can think of the case where the user
    # enters a wrong choice.
  end

  def display
    puts "-- Welcome to the CookBook --"

    while @running
      print "\n"

      display_tasks
      dispatch(user_input)

      print "\n"
    end
  end

  ###
  ##  You don't need to modify the following methods !
  ###
  def display_tasks
    puts "What do you want to do? \n"
    puts TASKS.values
  end

  # The dispatch method takes a String or a Symbol as an argument
  # and calls the method with the same name.
  #
  #  Examples:
  #
  #   dispatch(:del) => Will call the `del` method in the current class
  #   dispatch("add") => Will call the `add` method in the current class
  #
  # To understand this, read the doc : http://ruby-doc.org/core-2.1.1/Object.html#method-i-send
  def dispatch(task)
    self.send(task.to_sym)
  end
end