json.array!(@recipes) do |recipe|
  json.extract! recipe, :name, :permalink, :image_name, :base_rating, :source_url
  json.url recipe_url(recipe, format: :json)
end