FactoryBot.define do
  factory :definition do
    title                        {Faker::Lorem.sentence}
    body                         {Faker::Lorem.sentence}
    association :user
  end
end
