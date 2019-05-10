# frozen_string_literal: true
require 'http'
require 'json'

class RecipeClient
  BASE_URL = "http://www.recipepuppy.com/api/".freeze
  DEFAULT_COUNTER = 20

  def initialize(dish_name)
    @dish_name = dish_name
  end

  def recipes(count=20)
    Enumerator.new do |yielder|
      page = 1

      loop do
        results = JSON.parse(HTTP.get(BASE_URL, params: { q: @dish_name, p: page }))['results']

        unless results.empty?
          results.map { |item| yielder << item }
          page += 1
        else
          raise StopIteration
        end
      end
    end.lazy.first(count)
  end
end
