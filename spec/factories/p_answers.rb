FactoryBot.define do
  factory :p_answer do
    answer                        {Faker::Lorem.word}
    user_id                       { FactoryBot.create(:user).id }
    p_definition_id               { FactoryBot.create(:p_definition).id }
  end
end
