# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create!(
    username:  "Example User",
    password:             "foobar",
    password_confirmation: "foobar",
    admin: true
)

99.times do |n|  
    username  = Faker::Name.unique.name
    password = "password"
    User.create!(
        username: username,
        password:             password,
        password_confirmation: password
    )
end

users = User.take(2)

50.times do  
    content = Faker::Lorem.sentence(word_count: 3) 
    users.each { |user| user.microposts.create!(content: content) }
end