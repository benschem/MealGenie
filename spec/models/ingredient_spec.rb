require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  subject(:ingredient) { create(:ingredient) }

  it 'has a valid factory' do
    expect(ingredient).to be_valid
  end

  describe 'attributes' do
    it 'has a name' do
      expect(ingredient).to respond_to(:name)
    end

    it 'has a description' do
      expect(ingredient).to respond_to(:description)
    end

    it 'has an amount' do
      expect(ingredient).to respond_to(:amount)
    end

    it 'has a measurement unit' do
      expect(ingredient).to respond_to(:measurement_unit)
    end
  end

  describe 'validations' do
    context 'name is nil' do
      let(:ingredient) { build :ingredient, name: nil }
      it 'validates presence of name' do
        expect(ingredient).not_to be_valid
      end
    end

    context 'description is nil' do
      let(:ingredient) { build :ingredient, description: nil }
      it 'validates presence of description' do
        expect(ingredient).not_to be_valid
      end
    end

    context 'amounts is nil' do
      let(:ingredient) { build :ingredient, amount: nil }
      it 'validates presence of amounts' do
        expect(ingredient).not_to be_valid
      end
    end

    context 'measurement_units is nil' do
      let(:ingredient) { build :ingredient, measurement_unit: nil }
      it 'validates presence of measurement units' do
        expect(ingredient).not_to be_valid
      end
    end
  end

  describe 'associations' do
    it 'belongs to a meal' do
      expect(ingredient.meal).to be_truthy
      expect(ingredient.meal).to be_a(Meal)
    end
  end
end

# Other things to test later besides newly added features:

# Edge Cases: Consider testing edge cases and boundary conditions for your model.
#   For example, test with invalid or extreme values for attributes,
#   test associations with empty or multiple related records,
#   and test scenarios that may cause conflicts or errors.

# Scopes: If you have defined any scopes in your model,
#   write tests to verify that the scopes return the expected records.

# Performance: For larger datasets, you might want to
#   test the performance of your model's queries.
#   Use tools like RSpec's be_benchmark or other profiling tools
#   to measure and assert the performance of critical queries or operations.

# Serialization: If your model is serialized or includes serialization methods,
#   ensure that the serialization and deserialization processes work correctly.
