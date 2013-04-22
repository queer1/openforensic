FactoryGirl.define do
  factory :user do
    name     "Jimbo Slice"
    email    "michael@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end