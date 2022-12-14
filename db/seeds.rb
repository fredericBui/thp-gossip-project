# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "faker"

# [TO-DO] Factoriser le code quand tu as le temps

def resetData
    # Du plus dépendant au moins dépendant
    SubComment.destroy_all
    Like.destroy_all
    Comment.destroy_all
    PrivateMessageReceived.destroy_all
    PrivateMessage.destroy_all
    GossipTag.destroy_all
    Gossip.destroy_all
    User.destroy_all
    City.destroy_all
    Tag.destroy_all
end

def createData

    10.times do
        City.create(
            name: Faker::Address.city,
            zip_code: Faker::Address.zip_code
        )
    end

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

    20.times do
        Gossip.create(
            title: Faker::Lorem.sentence,
            content: Faker::Lorem.paragraph,
            user: User.order(Arel.sql('RANDOM()')).first
        )
    end

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

    3.times do
        privateMessage = PrivateMessage.create(
            content: Faker::Lorem.paragraph,
            sender: User.find(rand(1..User.count))
        )
        lastUser = 0
        rand(1..3).times do
            randUser = User.find(rand(1..User.count))
            if lastUser != randUser
                PrivateMessageReceived.create(
                    receiver: randUser,
                    private_message: privateMessage,
                )
                lastUser = randUser
            end
        end
    end

    20.times do
        Comment.create(
            content: Faker::Lorem.paragraph,
            user: User.order(Arel.sql('RANDOM()')).first,
            gossip: Gossip.order(Arel.sql('RANDOM()')).first
        )
    end

    # [TO-DO] Need to be improve
    20.times do
        Like.create(
            user: User.order(Arel.sql('RANDOM()')).first,
            comment: Comment.order(Arel.sql('RANDOM()')).first,
            gossip: Gossip.order(Arel.sql('RANDOM()')).first
        )
    end

    5.times do
        SubComment.create(
            content: Faker::Lorem.paragraph,
            user: User.order(Arel.sql('RANDOM()')).first,
            comment: Comment.order(Arel.sql('RANDOM()')).first
        )
    end
end

def showData
    puts City.all
    puts User.all
    puts Gossip.all
    puts Tag.all
    puts GossipTag.all
    puts PrivateMessage.all
    puts PrivateMessageReceived.all
    puts Comment.all
    puts Like.all
    puts SubComment.all
end

resetData
createData
showData