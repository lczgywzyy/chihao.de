json.array!(@restaurants) do |restaurant|
  json.extract! restaurant, :id, :name, :description, :recipe_id, :image_url, :phone1, :phone2, :phone3, :phone4, :phone5
  json.url restaurant_url(restaurant, format: :json)
end
