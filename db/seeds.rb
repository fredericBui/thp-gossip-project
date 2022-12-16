# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

def reset_data
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

def create_city(number)
  number.times do
    City.create(
      name: Faker::Address.city,
      zip_code: Faker::Address.zip_code
    )
  end
end

def create_user(number)
  number.times do
    User.create(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      description: Faker::Lorem.paragraph,
      email: "#{Faker::Name.first_name}.#{Faker::Name.last_name}@gmail.com",
      age: rand(99),
      city: City.order(Arel.sql('RANDOM()')).first
    )
  end
end

def create_gossip(number)
  number.times do
    Gossip.create(
      title: Faker::Lorem.sentence,
      content: Faker::Lorem.paragraph,
      user: User.order(Arel.sql('RANDOM()')).first
    )
  end
end

def create_tag(number)
  number.times do
    Tag.create(
      title: Faker::Lorem.word
    )
  end
end

def create_gossip_tag
  all_gossip = Gossip.all

  all_gossip.each do |gossip|
    rand(1..2).times do
      GossipTag.create(
        gossip:,
        tag: Tag.order(Arel.sql('RANDOM()')).first
      )
    end
  end
end

def create_private_message(number)
  number.times do
    private_message = PrivateMessage.create(
      content: Faker::Lorem.paragraph,
      sender: User.find(rand(1..User.count))
    )
    create_private_message_received(private_message)
  end
end

def create_private_message_received(private_message_created)
  last_user = 0
  rand(1..3).times do
    rand_user = User.find(rand(1..User.count))
    next unless last_user != rand_user

    PrivateMessageReceived.create(
      receiver: rand_user,
      private_message: private_message_created
    )
    last_user = rand_user
  end
end

def create_comment(number)
  number.times do
    Comment.create(
      content: Faker::Lorem.paragraph,
      user: User.order(Arel.sql('RANDOM()')).first,
      gossip: Gossip.order(Arel.sql('RANDOM()')).first
    )
  end
end

def create_like(number)
  # [TO-DO] Need to be improve. Just like comment or gossip
  number.times do
    randChoice = rand(0..1)
    case randChoice
      when 0
        puts "choice like 0"
        Like.create(
          user: User.order(Arel.sql('RANDOM()')).first,
          liked: Comment.order(Arel.sql('RANDOM()')).first
        )
      when 1
        puts "choice like 1"
        Like.create(
          user: User.order(Arel.sql('RANDOM()')).first,
          liked: Gossip.order(Arel.sql('RANDOM()')).first
        )
    end
  end
end

def create_sub_comment(number)
  SubComment.create(
    content: Faker::Lorem.paragraph,
    user: User.order(Arel.sql('RANDOM()')).first,
    attached: Comment.order(Arel.sql('RANDOM()')).first
  )
  number.times do
    randChoice = rand(0..1)
    case randChoice
      when 0
        puts 'choice sub_comment 0'
        SubComment.create(
          content: Faker::Lorem.paragraph,
          user: User.order(Arel.sql('RANDOM()')).first,
          attached: Comment.order(Arel.sql('RANDOM()')).first
        )
      when 1
        puts 'choice sub_comment 1'
        SubComment.create(
          content: Faker::Lorem.paragraph,
          user: User.order(Arel.sql('RANDOM()')).first,
          attached: SubComment.order(Arel.sql('RANDOM()')).first
        )
      end
  end
end

def show_data1
  puts City.all
  puts User.all
  puts Gossip.all
  puts Tag.all
  puts GossipTag.all
end

def show_data2
  puts PrivateMessage.all
  puts PrivateMessageReceived.all
  puts Comment.all
  puts Like.all
  puts SubComment.all
end

reset_data
create_city(10)
create_user(10)
create_gossip(20)
create_tag(10)
create_gossip_tag
create_private_message(3)
create_comment(20)
create_like(20)
create_sub_comment(5)
show_data1
show_data2
