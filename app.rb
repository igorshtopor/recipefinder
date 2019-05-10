require 'sinatra'
require 'json'
require './lib/recipe_client'
require './lib/recipe_presenter'

get '/' do
  haml :index
end

get '/fetch' do
  result = RecipeClient.new(params[:dish]).recipes(20)
  recipes = result.map{|r| RecipePresenter.new(r)}
  haml :result, locals: { recipes: recipes }
end
