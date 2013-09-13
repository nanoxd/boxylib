# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'

FactoryGirl.define do
  factory :book do
    title { Faker::Commerce.product_name }
    author { Faker::Name.name }
    series { Faker::Commerce.product_name }
    isbn { Faker::Code.isbn }
    genre { Faker::Name.title }
    description { Faker::Lorem.paragraph }

    factory :invalid_book do
      isbn nil
    end
  end
end
