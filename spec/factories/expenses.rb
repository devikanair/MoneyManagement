# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :expenses do
    user_id 1
    comment "MyString"
    amount 1.5
  end
end
