
class RecipeCard
    attr_reader :recipe, :user, :date, :rating
    @@all = []
    def initialize(date, rating, user, recipe)
        @recipe = recipe
        @user = user
        @date = date
        @rating = rating
        save
    end

    def self.all
        @@all
    end
    
    def save
        self.class.all << self
    end
end