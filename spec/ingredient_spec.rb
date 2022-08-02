require './lib/ingredient'

RSpec.describe Ingredient do
    before :each do
        @ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    end

    it 'exists' do 
        expect(@ingredient1).to be_a(Ingredient)
    end

    it 'can return ingredient attributes' do
        expect(@ingredient1.name).to eq("Cheese")
        expect(@ingredient1.unit).to eq("oz")
        expect(@ingredient.calories).to eq(50)
    end
end