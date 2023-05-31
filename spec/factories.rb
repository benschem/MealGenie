require 'faker'

FactoryBot.define do
  factory :order, class: 'Order' do
    # No attributes but the block needs to exist
  end

  factory :meal, class: 'Meal' do
    name { Faker::Food.dish }
    prep_time { Faker::Number.between(from: 5, to: 60).to_s + ' minutes' }
    servings { Faker::Number.between(from: 1, to: 6).to_s }
    instructions { Faker::Lorem.paragraph }

    transient do
      order { nil }
      ingredients_count { 3 }
    end

    after(:build) do |meal, evaluator|
      meal.ingredients = build_list(:ingredient, evaluator.ingredients_count, meal: meal)
      meal.orders << evaluator.order if evaluator.order.present?
    end
  end

  factory :ingredient, class: 'Ingredient' do
    name { Faker::Food.ingredient }
    description { Faker::Food.description }
    amount { Faker::Number.between(from: 1, to: 100) }
    measurement_unit { %w[Grams Kilograms Cups Teaspoons Tablespoons].sample }
    meal
  end
end
