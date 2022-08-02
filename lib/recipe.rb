class Recipe

    attr_reader :name,
                :ingredients_required,
                :ingredients

    def initialize(name)
        @name = name
        @ingredients_required = Hash.new(0)
        @ingredients = []
    end

    def add_ingredient(ingredient, amount)
        @ingredients_required[ingredient] += amount
        ingredients << ingredient

        # @ingredients_required.keys
    end

    def total_calories
        total = 0
        @ingredients_required.each do |ingredient|
            total += ((ingredient[0].calories) * ingredient[1])
        end
        total
        ##########################
        # calories = @ingredients_required.map do |ingredient, qty|
        #     ingredient.calories * qty
        # end

        # calories.sum
        ##########################
        # @ingredients_required.sum do |ingredient, qty|
        #     ingredient.calories * qty
        # end
    end
end
