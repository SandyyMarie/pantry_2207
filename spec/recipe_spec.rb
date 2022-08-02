require './lib/ingredient'
require './lib/recipe'

RSpec.describe Recipe do
    before :each do
        @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
        @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
        @ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
        @ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})
        @recipe1 = Recipe.new("Mac and Cheese")
        @recipe2 = Recipe.new("Cheese Burger")
    end

    it 'exists' do
        expect(@recipe1).to be_a(Recipe)
    end

    it 'can return initial recipe attributes' do
        expect(@recipe1.name).to eq("Mac and Cheese")
        expect(@recipe1.ingredients_required).to eq({})
    end

    it 'can add ingredients' do
        @recipe1.add_ingredient(@ingredient1, 2)
        @recipe1.add_ingredient(@ingredient1, 4)
        @recipe1.add_ingredient(@ingredient2, 8)
        expect(@recipe1.ingredients_required.count).to eq(2)
        expect(@recipe1.ingredients.count).to eq(3)
    end

    it 'can return the amount of total calories in a given recipe' do
        @recipe1.add_ingredient(@ingredient1, 2)
        @recipe1.add_ingredient(@ingredient2, 8)
        @recipe2.add_ingredient(@ingredient1, 2)
        @recipe2.add_ingredient(@ingredient3, 4)
        @recipe2.add_ingredient(@ingredient4, 1)
        expect(@recipe1.total_calories).to eq(440)
        expect(@recipe2.total_calories).to eq(675)
    end
end