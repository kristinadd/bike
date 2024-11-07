FactoryBot.define do
  factory :ride do
    association :start_city, factory: :city
    association :end_city, factory: :city
    association :user
    
    name { "Sunday ride to my favoute place" }
    recommendation { { name: "Famous Pizza Place",  description: "The bast pizza is Margarita" } }
    distance { 100 }

    # just to try how to use traits
    trait :large_distance do
      distance { 10000 }
    end
  end
end
