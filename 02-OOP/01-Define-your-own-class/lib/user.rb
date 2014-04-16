require_relative "address.rb"

class User
  attr_accessor :first_name, :last_name, :address
  def initialize(first_name, last_name, address)
    @first_name = first_name
    @last_name = last_name
    @address = address
  end
end

person_address = Address.new(8, "Rue du Stade", "14160", "Dives sur mer", "France").address_format

person = User.new("Jean-Marc", "Pélicier", person_address)
puts "#{person.first_name} #{person.last_name}"
puts person.address