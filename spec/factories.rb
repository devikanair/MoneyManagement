FactoryGirl.define do
  factory :user do
    name     "Devika Nair"
    email    "s.devikanair@gmail.com"
    password "foobarr"
    password_confirmation "foobarr"
    account 12345
  end
end