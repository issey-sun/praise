FactoryBot.define do
  factory :like do
    association :definition
    association :answer
    user { answer.user }
  end
end
