FactoryBot.define do
  factory :user do
    email                           {Faker::Internet.free_email}
    password                        { 'abc1234' }
    password_confirmation           { 'abc1234' }
    nickname                        {Faker::Name.initials(number: 2)}
    occupation                      {Faker::Company.name}
    position                        {Faker::Company.name}
    image                           {Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/factories/test.jpg')) }
    birth_day                       {Faker::Date.birthday}
    sex_id                          {Faker::Number.between(2, 5)}
    # admin                           {Faker::Boolean.boolean(true_ratio: 0.2)}
    admin                           {false}
  end
end
