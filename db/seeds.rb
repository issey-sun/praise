# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user = User.create!(email: "admin@example.jp",
  password:  "Issei1234",
  password_confirmation: "Issei1234",
  nickname:  "管理者",
  occupation: "管理者",
  position: "管理者",
  birth_day: "2000-10-10",
  sex_id: "2",
  admin: true)

  # user.image.attach(io: File.open(Rails.root.join("app/assets/images/download-2.jpg")), filename: "download-2.jpg")
  user.image.attach(io: File.open("app/assets/images/homekatajiten.png"), filename: "homekatajiten.png", content_type: "image/png")