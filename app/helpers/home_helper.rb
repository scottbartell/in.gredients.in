module HomeHelper
  def title name
    name.titleize
  end

  def ingredient_list ingredients
    ingredients.map{|c| c.name.titleize}.to_sentence
  end

  def square_image image_name
    image_name += '_380x250.jpg'
    image_tag(image_name, size: '380x250')
  end
end
