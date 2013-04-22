module HomeHelper
  def title name
    name.titleize
  end

  def ingredient_list ingredients
    ingredients.map{|c| c.name.titleize}.to_sentence.truncate(50)
  end

  def square_image image_name
    image_name += '_250x250.jpg'
    image_tag(image_name, size: '250x250')
  end
end
