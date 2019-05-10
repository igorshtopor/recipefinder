require 'sinatra'
require 'json'
require File.expand_path '../lib/recipe_client', __FILE__
require File.expand_path '../lib/recipe_presenter', __FILE__

get '/' do
  haml :index
end

get '/fetch' do
  result = RecipeClient.new(params[:dish]).recipes(20)
  recipes = result.map{|r| RecipePresenter.new(r)}
  haml :result, locals: { recipes: recipes }
end
