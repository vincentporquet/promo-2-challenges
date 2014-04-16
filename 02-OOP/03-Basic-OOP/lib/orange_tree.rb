class OrangeTree
  # TODO: Implement all the specs defined in the README.md :)
  attr_accessor :age, :height, :fruits, :fruit_count
  #donner un age à notre arbre
  #donner une taille à notre arbre
  def initialize
  @fruits = 0
  @age = 0.to_i
  @height = 0
  @fruit_count = 0
  end

  #tous les ans, il prend 1 an!
  def one_year_passes!
    @age += 1
  end

  #si il à moins de 10 ans
    #il grandi de 1m/an
  #sinon
    #il grandit pas
  def height
    if @age < 10
      @height = @age
    else @age > 10
      @height = 10
    end
  end

  # notre arbre donne des fruits
   #si entre 5 et 10 ans
    #100 fruits par an
   #si entre 10 et 15 ans
    #200 fruits par an
   #sinon
    #pas de fruit
  def fruits
    if @age.to_i.between?(6, 10)
      @fruits = 100 && @fruit_count = 100
    elsif @age.to_i.between?(10, 15)
      @fruits = 200 && @fruit_count = 200
    else
      @fruits = 0
    end
  end

  #on peut prendre un fruit
  def pick_a_fruit!
    if @fruits_count.to_i > 0
      @fruits.to_i = @fruits -1
    else
      "there is no more fruits"
    end
  end

  #meurt entre 50 et 100 ans
  def dead?
    if @age.to_i <= 50
      false
    else
      true
    end
  end
end
