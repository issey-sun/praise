FactoryBot.define do
  factory :answer do
    answer                        {Faker::Lorem.word}
    user_id                       { FactoryBot.create(:user).id }
    definition_id                 { FactoryBot.create(:definition).id }
  end
end
