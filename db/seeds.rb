require 'faker'

10.times do
    User.create!(
        email: Faker::Internet.unique.email,
        password: Faker::Number.number(6)
    )
end

me = User.create!(
    email: 'dcschreck@hotmail.com',
    password: 'password'
)

users = User.all

10.times do
    Item.create!(
        name: Faker::Seinfeld.quote,
        user: users.sample
    )
end

old = Item.create!(
    name: Faker::Seinfeld.character,
    user: me,
    created_at: Date.parse('23/07/2018')
)

10.times do
    Item.create!(
        name: Faker::Seinfeld.quote,
        user: me
    )
end

items = Item.all

puts "Seeds finished"
puts "#{User.count} users created"
puts "#{Item.count} items/To-Dos created"
