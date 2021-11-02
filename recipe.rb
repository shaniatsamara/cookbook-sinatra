class Recipe
  attr_reader :name, :description, :rating, :status, :prep_time

  def initialize(name, description, rating, status, prep_time)
    @name = name
    @description = description
    @rating = rating
    @status = status || false
    @prep_time = prep_time
  end

  def mark_as_done!
    @status = true
  end

  def rating_text
    "Rating: #{@rating} stars"
  end
end
