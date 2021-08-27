# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning database"
Booking.destroy_all
Piece.destroy_all
User.destroy_all

puts 'Database is clean'

puts 'Creating pieces'

user_array = []
15.times do
  user = User.new(
    first_name: Faker::Name.name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: ['password1', 'password2', 'password3', 'password4', 'password5'].sample
  )
  file = URI.open('https://picsum.photos/400')
  user.photo.attach(io: file, filename: 'nes.jpg', content_type: 'image/jpg')
  user.save!
  user_array << user

  piece_array = []
  piece = Piece.new(
    name: Faker::Book.title,
    height: Faker::Number.number(digits: 2),
    length: Faker::Number.number(digits: 2),
    price: Faker::Number.number(digits: 2),
    address: Faker::Address.city,
    description: Faker::Fantasy::Tolkien.poem,
    category: ['Sculpture', 'Photography', 'Oil Painting', 'Painting', 'Illustration'].sample,
    artist: Faker::Artist.name,
    user_id: user_array.sample.id
  )
  file = URI.open('https://source.unsplash.com/random')
  piece.photo.attach(io: file, filename: 'nes.jpg', content_type: 'image/jpg')
  piece.save!
  piece_array << piece

  random_day = rand(19..30)
  booking = Booking.new(
    date_start: DateTime.new(2020, 11, 18), # Date.parse("18/11/2020")
    date_end: DateTime.new(2020, 11, random_day),
    # status: ['pending', 'confirmed', 'pending'].sample,
    user: user_array.sample,
    piece: piece_array.sample
  )
  booking.save!
end

# 5.times do
#   random_day = rand(19..30)
#   booking = Booking.new(
#     date_start: DateTime.new(2020, 11, 18), # Date.parse("18/11/2020")
#     date_end: DateTime.new(2020, 11, random_day),
#     # status: ['pending', 'confirmed', 'pending'].sample,
#     user_id: rand(1..5),
#     piece_id: rand(1..5)
#   )
#   booking.save
# end
 puts 'done'
