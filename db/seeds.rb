# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user_password = "12345678"
user_password_confirmation = user_password

for i in 1..50
  user_name = "User#{i}"
  user_email = "user#{i}@example.com"
  User.create!(name: user_name, email: user_email, password: user_password, 
    password_confirmation: user_password_confirmation)
end

users = User.order(:id).take(40)
users.each_with_index do|user, idx|
  user.posted_quests.create!(title: user.name + " title", description: user.name + " quest description", 
    reward: idx, source: Faker::Address.street_address, destination: Faker::Address.street_address)

end

for i in 1..50
  Quest.create!(title: "System quest #{i}", description: "Description of system quest #{i}",
    reward: "0$", source: "TBD", destination: "TBD")
end
