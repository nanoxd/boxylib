# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'
include ActionDispatch::TestProcess


FactoryGirl.define do
  factory :book do
    title { Faker::Commerce.product_name }
    author { Faker::Name.name }
    series { Faker::Commerce.product_name }
    isbn { Faker::Code.isbn }
    genre { Faker::Name.title }
    description { Faker::Lorem.paragraph }
    ebook_file_name { Faker::Internet.domain_word + ".epub" }
    ebook_content_type "application/epub+zip"
    ebook_file_size { Faker::Number.number(4) }
    ebook_updated_at { Time.now - 2.hours }
    user

    factory :invalid_book do
      isbn 1234567890123456
    end
  end
end
