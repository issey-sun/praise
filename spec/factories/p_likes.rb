FactoryBot.define do
  factory :p_like do
    association :p_definition
    association :p_answer
    user { p_answer.user }
  end
end
