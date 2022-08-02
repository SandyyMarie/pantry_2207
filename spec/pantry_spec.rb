require './lib/ingredient'
require './lib/pantry'
require './lib/recipe'

RSpec.describe Pantry do
    before :each do 
        @ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
        @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})
        @recipe1 = Recipe.new("Mac and Cheese")
        @recipe1.add_ingredient(@ingredient1, 2)
        @recipe1.add_ingredient(@ingredient2, 8)
        @pantry = Pantry.new
    end

    it 'exists' do
        expect(@pantry).to be_a(Pantry)
    end

    it 'can return the current empty hash of current stock' do
        expect(@pantry.stock).to eq({})
    end

    it 'can check the current amount of a given stock item' do
        expect(@pantry.stock_check(@ingredient1)).to eq(0)
    end

    it 'can restock a given ingredient' do
        @pantry.restock(@ingredient1, 5)
        @pantry.restock(@ingredient1, 10)
        @pantry.restock(@ingredient2, 7)
        expect(@pantry.stock.count).to eq(2)
        expect(@pantry.stock_check(@ingredient1)).to eq(15)
        expect(@pantry.stock_check(@ingredient2)).to eq(7)
    end

    it 'can return if theres not enough ingredients for a given recipe' do
        expect(@pantry.enough_ingredients_for?(@recipe1)).to eq(false)
    end

    it 'can return that there is enough ingredients for a given recipe' do
        @pantry.restock(@ingredient1, 5)
        @pantry.restock(@ingredient1, 10)
        @pantry.restock(@ingredient2, 7)
        @pantry.restock(@ingredient2, 1)
        expect(@pantry.enough_ingredients_for?(@recipe1)).to eq(true)
    end
end