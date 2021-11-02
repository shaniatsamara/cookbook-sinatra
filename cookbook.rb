require_relative 'recipe'

class Cookbook
  attr_reader :recipes

  require 'csv'
  CSV_OPTIONS = { col_sep: ',', force_quotes: true, quote_char: '"' }

  def initialize(csv_file)
    @csv_file = csv_file
    @recipes = []
    load_csv
  end

  def all
    @recipes
  end

  def find(index)
    @recipes[index]
  end

  def add_recipe(recipe)
    @recipes << recipe
    store_csv
  end

  def remove_recipe(index)
    @recipes.delete_at(index)
    store_csv
  end

  def load_csv
    CSV.foreach(@csv_file) do |row|
      recipe = Recipe.new(row[0], row[1], row[2], row[3] == "true", row[4])
      @recipes << recipe
    end
  end

  def store_csv
    CSV.open(@csv_file, 'wb', CSV_OPTIONS) do |csv|
      @recipes.each do |item|
        csv << [item.name, item.description, item.rating, item.status, item.prep_time]
      end
    end
  end
end
