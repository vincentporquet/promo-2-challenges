class OrangeTree
  # TODO: Implement all the specs defined in the README.md :)
  attr_accessor :age, :height, :fruits, :pick_a_fruit
  #donner un age à notre arbre
  #donner une taille à notre arbre
  def initialize
  @fruits = 0
  @age = 0
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
    if @age = 0
      @height = 0
    elsif @age <= 10
      @height += 1
    else
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
    if @age.between?(6, 9)
      @fruits += 100
    elsif @age.between?(10, 15)
      @fruits += 200
    else
      @fruits = 0
    end
  end

  #on peut prendre un fruit
  def pick_a_fruit!
    if @fruits > 0
      @fruits -= 1
    else
      "there is no more fruits"
    end
  end

  #meurt entre 50 et 100 ans
  def dead?
    if @age > 100
      true
    else
      false
    end
  end
end
