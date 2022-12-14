# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "faker"

GossipTag.destroy_all
Gossip.destroy_all
User.destroy_all
City.destroy_all
Tag.destroy_all

10.times do
    City.create(
        name: Faker::Address.city,
        zip_code: Faker::Address.zip_code
    )
end

puts City.all

10.times do
    User.create(
        first_name: Faker::Name.first_name, 
        last_name: Faker::Name.last_name, 
        description: Faker::Lorem.paragraph,
        email: "#{Faker::Name.first_name}.#{Faker::Name.last_name}@gmail.com",
        age: rand(99),
        city: City.order(Arel.sql('RANDOM()')).first
    ) 
end

puts User.all

20.times do
    Gossip.create(
        title: Faker::Lorem.sentence,
        content: Faker::Lorem.paragraph,
        user: User.order(Arel.sql('RANDOM()')).first
    )
end

puts Gossip.all

10.times do
    Tag.create(
        title: Faker::Lorem.word
    )
end

allGossip = Gossip.all

allGossip.each do | gossip |
    rand(1..2).times do
        GossipTag.create(
            gossip: gossip,
            tag: Tag.order(Arel.sql('RANDOM()')).first
        )
    end
end 

puts GossipTag.all