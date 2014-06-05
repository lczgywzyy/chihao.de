json.array!(@recipes) do |recipe|
  json.extract! recipe, :id, :name, :price, :description, :restaurant_id, :image_url
  json.url recipe_url(recipe, format: :json)
end
