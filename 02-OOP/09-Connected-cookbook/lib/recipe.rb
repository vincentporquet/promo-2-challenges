class Recipe

  attr_reader :name, :rating, :cook_time, :prep_time

  def initialize(name, rating, cook_time, prep_time)

    @name = name
    @rating = rating
    @cook_time = cook_time
    @prep_time = prep_time

  end

end
