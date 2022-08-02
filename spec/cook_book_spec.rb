require './lib/ingredient'
require './lib/recipe'
require './lib/cook_book'

RSpec.describe CookBook do
    before :each do
        @recipe1 = Recipe.new("Mac and Cheese")
        @recipe2 = Recipe.new("Cheese Burger")
        @cookbook = CookBook.new
    end

    it 'exists' do
        expect(@cookbook).to be_a(CookBook)
    end

    it 'can return empty recipe array' do
        expect(@cookbook.recipes).to eq([])
    end

    it 'can add recipes to cookbook' do
        @cookbook.add_recipe(@recipe1)
        @cookbook.add_recipe(@recipe2)
        expect(@cookbook.recipes.count).to eq(2)
    end

    it 'can return the highest calorie meal' do
        expect(@cookbook.highest_calorie_meal).to be_a(Recipe) #can rewrite
    end
end