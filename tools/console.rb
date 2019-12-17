require_relative '../config/environment.rb'
require_relative '../app/models/Allergy.rb'
require_relative '../app/models/Ingredient.rb'
require_relative '../app/models/Recipe.rb'
require_relative '../app/models/RecipeCard.rb'
require_relative '../app/models/RecipeIngredient.rb'
require_relative '../app/models/User.rb'

user1 = User.new('Matz')
# user2 = User.new('Brooke')
# user3 = User.new('Jason')
# user4 = User.new('Eddy')
# user5 = User.new('Spongebob')

recipe1 = Recipe.new('Apple Pie')
recipe2 = Recipe.new('Pizza')
recipe3 = Recipe.new('Donut')
recipe4 = Recipe.new('Cherry Pie')
recipe5 = Recipe.new('Hamburger')
recipe6 = Recipe.new('Tacos')
recipe7 = Recipe.new('Korean BBQ')
recipe8 = Recipe.new('Sheppard Pie')
recipe9 = Recipe.new('Angel Hair')

ingredient1 = Ingredient.new("Saffron")
ingredient2 = Ingredient.new("Peanut")
ingredient3 = Ingredient.new("Shrimp")

allergy1 = Allergy.new(user1,ingredient1)
allergy2 = Allergy.new(user1,ingredient3)
# allergy3 = Allergy.new(user3,ingredient1)

recipe_ingredients1 = RecipeIngredient.new(recipe1,[ingredient1,ingredient3])
recipe_ingredients2 = RecipeIngredient.new(recipe2,[ingredient2, ingredient1])
recipe_ingredients3 = RecipeIngredient.new(recipe3,[ingredient2])

recipe_card1 = RecipeCard.new('date1', 2, user1, recipe1)
recipe_card2 = RecipeCard.new('date2', 3, user1, recipe2)
recipe_card3 = RecipeCard.new('date3', 10, user1, recipe3)
# recipe_card4 = RecipeCard.new('date3', 8, user1, recipe8)
# recipe_card5 = RecipeCard.new('date3', 9, user1, recipe7)


# recipe1.add_ingredients([Ingredient.new("masala")])



binding.pry
