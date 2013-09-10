# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :book do
    title "MyString"
    author "MyString"
    series "MyString"
    isbn 1
    genre "MyString"
  end
end
