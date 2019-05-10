require 'minitest/autorun'
require File.expand_path '../../lib/recipe_presenter', __FILE__

class RecipePresenterTest < Minitest::Test
  def presenter
    RecipePresenter.new(
        {
            "title"=>"Ginger Champagne",
            "href"=>"http://allrecipes.com/Recipe/Ginger-Champagne/Detail.aspx",
            "ingredients"=>"champagne, ginger, ice, vodka",
            "thumbnail"=>"http://img.recipepuppy.com/1.jpg"}
    )
  end

  def test_title
    assert_equal 'Ginger Champagne', presenter.title
  end

  def test_href
    assert_equal 'http://allrecipes.com/Recipe/Ginger-Champagne/Detail.aspx', presenter.href
  end

  def test_ingredients
    assert_equal 'champagne, ginger, ice, vodka', presenter.ingredients
  end

  def test_thumbnail
    assert_equal 'http://img.recipepuppy.com/1.jpg', presenter.thumbnail
  end

  def test_thumbnail_fallback
    assert_equal '/dish.png', RecipePresenter.new({ 'thumbnail' => ''}).thumbnail
  end
end
