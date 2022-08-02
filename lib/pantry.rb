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
            if stock_check(ingredient[0]) >= ingredient[1]
                enough = true
            else
                enough = false
            end
        end
        enough

        ##########################
        # recipe.ingredients_required.all? do |ingredient, amt|
        #     @stock[ingredient] >= amt
        # end
        ##########################
        # recipe.ingredients_required.map do |ingredient, qty|
        #     @stock[ingredient] >= qty
        # end.all?(true) #true not required
        ##########################
        # enough = true
        # recipe.ingredients_required.each do |ingredient, qty|
        #     enough = false unless @stock[ingredient] >= qty
        # end
        # enough
        ##########################

    end
end
