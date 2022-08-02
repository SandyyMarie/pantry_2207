class CookBook

    attr_reader :recipes

    def initialize
        @recipes = []
    end

    def add_recipe(recipe)
        @recipes << recipe
    end

    def highest_calorie_meal
        comparison_recipe = @recipes.first
        @recipes.each do |recipe|
            if recipe.total_calories > comparison_recipe.total_calories
                comparison_recipe = recipe
            end
        end
        comparison_recipe
    end
end
