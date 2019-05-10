require 'minitest/autorun'
require File.expand_path '../../lib/recipe_client', __FILE__

class RecipeClientTest < Minitest::Test
  def client(dish)
    RecipeClient.new(dish)
  end

  def test_recipes_counter
    assert_equal 5, client('lasagna').recipes(5).count
  end

  def test_recipes_no_results
    assert [], client('makingnosensestring').recipes(20)
  end

  def test_recipes_default_counter
    assert_equal 20, client('lasagna').recipes.count
  end
end
