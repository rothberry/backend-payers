# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


puts "RESETING DATABASE..."
Transaction.delete_all
User.delete_all
Payer.delete_all


puts "SEEDING..."

puts "CREATING USERS..."
u1 = User.create(name: "test_user_1")
u2 = User.create(name: "test_user_2")

puts "CREATING PAYERS..."
dannon = Payer.create(name: "DANNON")
unilever = Payer.create(name: "UNILEVER")
coors = Payer.create(name: "MILLER COORS")


puts "CREATING TRANSACTIONS..."
Transaction.create(user: u1, payer: dannon, points: 1000, timestamp: DateTime.now.utc)
sleep 1
Transaction.create(user: u1, payer: unilever, points: 2000, timestamp: DateTime.now.utc)
sleep 1
Transaction.create(user: u1, payer: coors, points: 3000, timestamp: DateTime.now.utc)

puts "DONE!"
