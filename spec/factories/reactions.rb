FactoryBot.define do
  factory :reaction do
    association :user
    association :ride

    reaction_type { 'love' }
  end
end
