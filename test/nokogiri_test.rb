LIVE_DIR = "/home/deployer/awesome/punchfork/*"
LOCAL_DIR = "/vagrant/gredients.in/spec/*"

Dir.glob(LOCAL_DIR) do |txt|
  f = File.read(txt)
  page = Nokogiri::HTML(f)

  next if page.blank?

  name = page.css('div.column1 div.info-card-wrapper div.info-card h1.title').text
  permalink = name.parameterize[0..128]

  next if Recipe.exists? permalink: permalink

  image_name = page.css("div.portrait-frame.lg div.portrait a img")[0]['src'].gsub("http://img.punchfork.net/","").gsub("_380x250.jpg","")
  base_rating = page.css('div#metrics div.box span.value.strong').text.to_f
  source_url = URI.unescape(page.css('div.column1 div.info-card-wrapper div.info-card a.source')[0]['href']).gsub("/r?url=", "")
  source_name = page.css("html head meta[property='punchforkapp:from']")[0]["content"].downcase
  published_at = page.css("div.recipe-details div.column2 div#who-likes p#published")[0]['content'].to_date

  # create or find source
  source = Source.find_or_create_by name: source_name

  # create recipe
  recipe = Recipe.create published_at: published_at, permalink: permalink, name: name, image_name: image_name, base_rating: base_rating, source_url: source_url, source: source

  #
  # ingredients stuff
  #
  vegan, vegetarian, gluten_free, paleo, ingredient_vegan, ingredient_gluten_free, ingredient_vegetarian = [false] * 7
  list = page.css('div.column1 div.info-card-wrapper div.ingredients-list div#categorized-ingredients ul')

  list.count.times do |i|
    if i == 1
      # always ignore the first ul - it's navigation
      next
    end
    if i == 2
      # the second ul tells if what diet it's friendly with
      # but might not exist :(
      diet = list[i-1].text
      vegan = diet.include?("vegan")
      vegetarian = diet.include?("vegetarian")
      gluten_free = diet.include?("gluten-free")
      paleo = diet.include?("paleo")
      unless !vegan and !vegetarian and !gluten_free and !paleo
        next
      end
    end
    ingredient_group = list[i-1].css("li span.ingredient-group").text
    list[i-1].css("li").each do |x|
      ingredient_diet = x.css("img.diet")
      unless ingredient_diet.empty?
        ingredient_diet = ingredient_diet[0]["title"]
        case ingredient_diet
        when "Vegan"
          ingredient_vegan = true
        when "Gluten-free"
          ingredient_gluten_free = true
        when "Vegetarian"
          ingredient_vegetarian = true
        end
      end
      name = x.css("span.ingredient-name").text
      if name
        ingredient_name = name.split(', ')[0]
        ingredient_type = name.split(', ')[1]
        if ingredient_type
          ingredient_type = ingredient_type.downcase
        end
      end
      ingredient_n = x.css("span.ingredient-n").text
      ingredient_unit = x.css("span.ingredient-unit").text

      unless name.empty? and ingredient_n.empty? and ingredient_unit.empty?
        recipe.update_attributes paleo: paleo, vegan: vegan, vegetarian: vegetarian, gluten_free: gluten_free
        item = recipe.items.find_or_create_by name: ingredient_name.downcase, vegan: ingredient_vegan, gluten_free: ingredient_gluten_free, vegetarian: ingredient_vegetarian
        ingredient = recipe.ingredients.find_by item: item
        ingredient.update_attributes amount: ingredient_n, unit: ingredient_unit
      end
    end
  end
end