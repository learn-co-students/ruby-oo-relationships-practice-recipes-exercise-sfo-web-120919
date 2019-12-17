# ### `Recipe`
# Build the following methods on the Recipe class

# - `Recipe.all`
# should return all of the recipe instances
# - `Recipe.most_popular`
# should return the recipe instance with the highest number of users (the recipe that has the most recipe cards)
# - `Recipe#users`
# should return the user instances who have recipe cards with this recipe
# - `Recipe#ingredients`
# should return all of the ingredients in this recipe
# - `Recipe#allergens`
# should return all of the `Ingredient`s in this recipe that are allergens for `User`s in our system.
# - `Recipe#add_ingredients`
# should take an array of ingredient instances as an argument, and associate each of those ingredients with this recipe

class Recipe
    attr_reader :name
    @@all = []
    def initialize(name)
        @name = name
        save
    end

    def self.most_popular
        user_count = {}
        all_recipe_cards = RecipeCard.all
        all_recipe_cards.each do |r|
            #binding.pry

            if !user_count[r.recipe.name]  #there is not a recipe_name as a key in the user-count  
                user_count[r.recipe.name] = 1 #we are now adding recipe_name as a key with a value of 1
            else
                user_count[r.recipe.name] += 1
                
            end
        end #this is the end for the each
        # for this name var in line 40
        #we iterated over the hash, finding the highest values, and returning the array[0] 
        #because that gives us a name
        name = user_count.max_by {|k,v| v}[0] 
        Recipe.all.find do |r| #iterating through recipe all array, 
            name == r.name     # seeing if name from above matches the recipe.name
        end
    end

    def self.all
        @@all
    end
    
    def save
        self.class.all << self
    end

   
    def users
       all_r_cards = RecipeCard.all
       my_cards = all_r_cards.select do |c| #selecting recipecards that have the current recipe in this instance
        self == c.recipe
       end
       my_cards.map do |card| #now we want to iterate through my_cards (from the result array) on card instance get the user
        card.user
       end
        
    end

    #should return all of the ingredients in this recipe
    def ingredients
        all_r_ingredients = RecipeIngredient.all
        my_r_ingredients= all_r_ingredients.select do |i| #selecting recipeingredients that have the current recipe in this instance
         self == i.recipe
        end
        my_r_ingredients.map do |r_ingredient| #now we want to iterate through recipeingredients (from the result array) 
            #on recipeingredient instnce to get the ingredients
         r_ingredient.ingredients
        end.flatten

    end

   
    # - `Recipe#allergens`
    # should return all of the `Ingredient`s in this recipe that are allergens for `User`s in our system.
    def allergens
        allergies = Allergy.all
        recipe_ingredients = ingredients 
        my_allergies = allergies.select do |a|

             recipe_ingredients.include?(a.ingredient)
             #check to see if allergy ingredient is in the ingredients array from previous method
        end
        my_allergies.map do |a|
            a.ingredient
        end.uniq
    end

    def add_ingredients(ingredients)
# should take an array of ingredient instances as an argument, and associate each of those ingredients with this recipe
    RecipeIngredient.new(self, ingredients)
    
    end

    
end