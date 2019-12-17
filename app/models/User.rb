# - `User.all`
# should return all of the user instances
# - `User#recipes`
# should return all of the recipes this user has recipe cards for
# - `User#add_recipe_card`
# should accept a recipe instance as an argument, as well as a date and rating, and create a new recipe card for this user and the given recipe
# - `User#declare_allergy`
# should accept an`Ingredient` instance as an argument, and create a new `Allergy` instance for this `User` and the given `Ingredient`
# - `User#allergens`
# should return all of the ingredients this user is allergic to
# - `User#top_three_recipes`
# should return the top three highest rated recipes for this user.
# - `User#most_recent_recipe`
# should return the recipe most recently added to the user's cookbook.


class User
    attr_reader :name
    @@all = []
    def initialize(name)
        @name = name
        save
    end

    def self.all
        @@all
    end

    def save
        self.class.all << self
    end

    def recipe_cards 

        my_recipe_cards = all_recipe_cards.select do |recipe_card|
            recipe_card.user == self
        end

    end 

    def recipes
        all_recipe_cards = RecipeCard.all
        my_recipe_cards = recipe_cards 
        my_recipe_cards.map do |recipe_card|
            recipe_card.recipe
      
        end     
    end

    def add_recipe_card(recipe, date, rating)
        RecipeCard.new(date, rating, self, recipe)

    end
    
    def declare_allergy(ingredient)
        Allergy.new(self, ingredient)
    end
   
    def allergens
        all_allergies = Allergy.all
        my_allergies = all_allergies.select do |allergy|
            allergy.user == self
        end
        my_allergies.map do |allergy|
            allergy.ingredient
        end
    end

    def top_three_recipes
        
        my_recipe_cards = recipe_cards
        sorted_recipe_cards = my_recipe_cards.sort_by do |recipe_card|
            recipe_card.rating
        end
        sorted_recipe_cards.last(3)
    end

    def most_recent_recipe
        all_recipe_cards = RecipeCard.all
        my_recipe_cards = recipe_cards 
        most_recent_recipe_card = my_recipe_cards.sort_by do |recipe_card|
                recipe_card.date
            end
        most_recent_recipe_card.first.recipe
    end

    def add_good_recipe(recipe, arr)
            recipe.ingredients.each do |ingredient|
                if my_allergens.include?(ingredient)
                    break
                end

                if recipe.ingredients.last == ingredient
                    arr << recipe  
                end
    
    end 

    def safe_recipes 
        
            my_allergens = allergens
            my_recipes = recipes
            results = []
            my_recipes.each do |recipe|
                add_good_recipe(recipe, results)   
            end
            
            results
    end
 
end