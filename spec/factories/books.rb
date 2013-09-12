# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'

FactoryGirl.define do
  factory :book do
    title "Harry Potter and the Chamber of Secrets"
    author { Faker::Name.name }
    series "Harry Potter"
    isbn { Faker::Code.isbn }
    genre "Non-Fiction"
    description { Faker::Lorem.paragraph }
  end
end
