# spec/factories/employees.rb

FactoryBot.define do
  factory :employee do
    first_name { "John" }
    last_name { "Doe" }
    email { "john.doe@example.com" }
    date_of_birth { "1980-01-01" }
    address { "123 Main St" }
    country { "USA" }
    bio { ["Bio item 1", "Bio item 2"] }
    rating { 4.5 }
  end
end