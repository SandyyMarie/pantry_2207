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

        ##########################
        # @recipes.max_by do |recipe| 
        #     recipe.total_calories
        # end
        ##########################

    end

    # def ingredients
        ##########################
        # ingredients = @recipes.map do |recipe|
        #     recipe.ingredients_required.map do |ingredient|
        #         ingredients[0].name
        #     end
        # end
        # ingredients.flatten.uniq
        ##########################
        # @recipes.flat_map do |recipe|
        #     recipe.ingredients.map do |ingredient|
        #         ingredient.name
        #     end
        # end.uniq
    # end

    # @recipes.flat_map do |recipe|
    #     recipe.ingredients.map(&:name)
    # end.uniq
end
