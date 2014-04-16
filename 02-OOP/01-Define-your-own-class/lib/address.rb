class Address
  attr_accessor :number, :street, :zip_code, :city, :country

  def initialize(number, street, zip_code, city, country)
    @number = number
    @street = street
    @zip_code = validated_zip_code(zip_code)
    @city = city
    @country = country
  end

  def validated_zip_code(zip_code)
    if zip_code.length == 5
      @zip_code = zip_code
    else
      puts "Zip code incorrect"
    end
  end

  def address_format
    "#{number} #{street}\n#{zip_code} #{city}\n#{country}"
  end
end