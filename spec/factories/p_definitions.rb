FactoryBot.define do
  factory :p_definition do
    title                        {Faker::Lorem.word}
    body                         {Faker::Lorem.word}
  end
end
