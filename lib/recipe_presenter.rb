# frozen_string_literal: true

class RecipePresenter
  ['title', 'href', 'ingredients'].each do |attribute|
    define_method attribute do
      @recipe_hash[attribute]
    end
  end

  def initialize(recipe_hash)
    @recipe_hash = recipe_hash
  end

  def thumbnail
    if @recipe_hash['thumbnail'].empty?
      '/dish.png'
    else
      @recipe_hash['thumbnail']
    end
  end
end
