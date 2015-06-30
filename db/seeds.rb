# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'
require 'securerandom'



user = User.create! name: "amanda2",
                    email: "amanda@gmail.com",
                    password: "12345678",
                    password_confirmation: "12345678",
                    token: SecureRandom.hex(8)

10.times do
  secret = Secret.new
  secret.user = user
  secret.comment = Faker::Lorem.sentence(3)
  secret.title =  Faker::Lorem.sentence
  secret.save!
end
