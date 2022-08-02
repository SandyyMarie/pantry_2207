require './lib/ingredient'
require './lib/recipe'

RSpec.describe Recipe do
    before :each do
        @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
        @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
        @recipe1 = Recipe.new("Mac and Cheese")
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
        expect(@recipe1.total_calories).to eq(440)
        expect(@recipe2.total_calories).to eq(675)
    end
end