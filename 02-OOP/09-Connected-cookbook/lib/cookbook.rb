require 'csv'
require_relative 'recipe'
require_relative 'scraper'

class Cookbook

  attr_reader :contents

  def initialize(file)
    # TODO: Retrieve the data from your CSV file and store it in an instance variable
    load_csv(file)
    @file = file
  end

  def load_csv(file)
    @contents = []
    CSV.foreach(file) do|row|
      @contents << Recipe.new(row[0], row[1].to_i, row[2].to_i, row[3].to_i)
    end
  end

  def scrap(ingredient)
    scraper = ScraperMarmiton.new(ingredient)
    scraper.doc.search('.m_search_result').each do |element|
      name = element.search('.m_search_titre_recette > a').inner_text
      rating = element.search('.etoile1').size
      preparation_time = 10 #element.search('.m_search_result_part4').inner_text.match(/\d+/)[1]
      cooking_time = 10 #element.search('.m_search_result_part4').inner_text.match(/\d+/)[2]
      create(name, rating, preparation_time, cooking_time)
    end
  end

  # TODO: Implement the methods to retrieve all recipes, create, or destroy recipes
  def all
    @contents
  end

  def create(name, rating, cook_time, prep_time)
    @contents << Recipe.new(name, rating, cook_time, prep_time)
    save
  end

  def destroy(index)
    @contents.delete_at(index)
    save
  end

  # TODO: Implement a save method that will write the data into the CSV

  def save
    CSV.open(@file, "w") do |csv|
      @contents.each do |recipe|
        csv << [recipe.name, recipe.rating, recipe.cook_time, recipe.prep_time]
      end
    end
  end

  # And don't forget to use this save method when you have to modify something in your recipes array.
end