
class RecipeIngredient
    attr_reader :recipe, :ingredients #ingredients is an array, of ingredient objects, we pass this argument in when we make our instance in console
    @@all = []
    def initialize(recipe, ingredients)
        @recipe = recipe
        @ingredients = ingredients
        save
    end

    def self.all
        @@all
    end
    
    def save
        self.class.all << self
    end
end