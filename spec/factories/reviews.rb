FactoryBot.define do
  factory :review do
    association :definition
    association :user
    content                       {Faker::Lorem.word}
    score                         {'3'}
  end
end
