# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user_password = "12345678"
user_password_confirmation = user_password

for i in 1..10
  user_name = "User#{i}"
  user_email = "user#{i}@example.com"
  User.create!(name: user_name, email: user_email, password: user_password, 
    password_confirmation: user_password_confirmation)
end

users = User.order(:id).take(6)
users.each do|user|
  user.posted_deliveries.create!(title: user.name + " title", description: user.name + " quest description", 
    reward: "10$", source: Faker::Address.street_address, destination: Faker::Address.street_address)

end
