FactoryGirl.define do
  factory :user do
    username Faker::Internet.user_name
    password Faker::Internet.password(8)
  end
end
