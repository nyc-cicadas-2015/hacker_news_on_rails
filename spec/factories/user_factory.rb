FactoryGirl.define do
  factory :user do
    username Faker::Internet.user_name
    password Faker::Internet.password(8)
  end

  factory :post do
    title Faker::Hacker.say_something_smart
    link Faker::Internet.url
    user
  end

  factory :comment do
    body Faker::Hacker.say_something_smart
  end

end
