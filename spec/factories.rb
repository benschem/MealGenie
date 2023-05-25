require 'faker'

FactoryBot.define do
  factory :order, class: 'Order' do
    transient do
      meals_count { 3 }
    end

    meals do
      Array.new(meals_count) { association :meal, orders: [instance] }
    end
  end

  factory :meal, class: 'Meal' do
    name { Faker::Food.dish }
    prep_time { Faker::Number.between(from: 5, to: 60).to_s + ' minutes' }
    servings { Faker::Number.between(from: 1, to: 6).to_s }
    instructions { Faker::Lorem.paragraph }

    transient do
      order_count { 1 }
    end

    orders { build_list :order, order_count, meals: [instance] }

    transient do
      ingredients_count { 3 }
    end

    ingredients { build_list :ingredient, ingredients_count, meal: instance }
  end

  factory :ingredient, class: 'Ingredient' do
    name { Faker::Food.ingredient }
    description { Faker::Food.description }
    amount { Faker::Number.between(from: 1, to: 100) }
    measurement_unit { %w[Grams Kilograms Cups Teaspoons Tablespoons].sample }
    meal { association :meal, ingredients: [instance] }
  end
end
