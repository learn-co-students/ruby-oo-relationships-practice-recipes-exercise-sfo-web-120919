class Allergy 

    @@all = []
    attr_accessor :user, :ingredient

    def initialize(user, ingredient)
        @user = user
        @ingredient = ingredient
        save
    end

    def self.all
        @@all
    end
    
    def save
        self.class.all << self
    end

    def recipe_allergens
        
    end
end
