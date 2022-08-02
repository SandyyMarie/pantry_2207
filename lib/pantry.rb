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
end
