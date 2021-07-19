# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

4.times do
    rand_num = rand(1..6)
    Message.create(
        user_id: rand_num,
        content: Faker::TvShows::DrWho.quote,
    )
end

4.times do
    rand_user = rand(1..6)
    rand_message = rand(405..504)
    Reply.create(
        user_id: rand_user,
        message_id: rand_message,
        content: Faker::TvShows::TwinPeaks.quote,
    )
end

users = User.create([
    {name: 'Chelsea', password:'123'},
    {name: 'Guled', password:'1234'},
    {name: 'Obi', password:'12345'},
    {name: 'Blake', password:'123456'},
])


puts "Seeded Database"
