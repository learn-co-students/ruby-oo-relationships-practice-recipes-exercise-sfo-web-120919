class Ingredient 
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
    
    def self.most_common_allergen
        allergy_count = {}
        all_allergies = Allergy.all
        all_allergies.each do |allergy|
            if !allergy_count[allergy.ingredient.name]
                allergy_count[allergy.ingredient.name] = 1
            else
                allergy_count[allergy.ingredient.name] += 1
            end
        end
        most_common_allergen_name = allergy_count.max_by{|suck, it| it}[0]
        # in user instances allergens find that
        Allergy.all.find do |allergy|
            allergy.ingredient.name == most_common_allergen_name
        end.ingredient
    end
#     - `Ingredient.most_common_allergen`
# should return the ingredient instance that the highest number of users are allergic to
end

