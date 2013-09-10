# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence :isbn do |n|
    1232 + n
  end

  factory :book do
    title "Harry Potter and the Chamber of Secrets"
    author "J.K. Rowling"
    series "Harry Potter"
    isbn
    genre "Non-Fiction"
  end
end
