class Pantry

    attr_reader :stock

    def initialize
        @stock = Hash.new(0)
    end

    def stock_check(ingredient_search)
        @stock[ingredient_search.name]
    end

    def restock(ingredient_type, amount)
        @stock[ingredient_type.name] += amount
    end

    def enough_ingredients_for?(recipe)
        enough = false
        recipe.ingredients_required.each do |ingredient|
            if stock_check(ingredient[0]) == ingredient[1]
                enough = true
            end
        end
        enough
    end
end
