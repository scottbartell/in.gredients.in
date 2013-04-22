module RecipesHelper
  def recipe_image image_name, recipe_title
    img = image_name
    img += '_380x250.jpg'
    image_tag(image_name, size: '380x250', alt: recipe_title.titleize, itemprop: 'image')
  end
end
