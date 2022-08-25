# require "pry-byebug"
require "open-uri"
# require "faker"

puts "cleaning database...."
Profile.destroy_all
Artwork.destroy_all
User.destroy_all
ArtworkTransaction.destroy_all

puts "making admin user..."
admin = User.new(admin: true)
admin.email = "admin@admin.com"
admin.password = "123456"
admin.save!

######### Artworks seeds:
artworks_photos = ["https://res.cloudinary.com/dlpbxzb7o/image/upload/v1661330810/seeds/7g14doghnwc1uh2sg0xfz837ftfd.jpg",
                   "https://res.cloudinary.com/dlpbxzb7o/image/upload/v1661330814/seeds/r2vdzjwg4bxvesi8zhxu8q4sw526.jpg",
                   "https://res.cloudinary.com/dlpbxzb7o/image/upload/v1661330817/seeds/9mrxd8ku47yurs4vc0dxmdl6d0u7.jpg",
                   "https://res.cloudinary.com/dlpbxzb7o/image/upload/v1661330819/seeds/f1wkf2jp1xi17bb3nwgc33en5ycm.jpg",
                   "https://res.cloudinary.com/dlpbxzb7o/image/upload/v1661330822/seeds/tv4m6nrqg1wssnhm5rkbu2o06y7p.jpg"]

artists_photos = ["https://res.cloudinary.com/dlpbxzb7o/image/upload/v1661410813/seeds/toa-heftiba-0rlfiRSdVzU-unsplash_dk6tht.jpg",
                  "https://res.cloudinary.com/dlpbxzb7o/image/upload/v1661410817/seeds/frankie-cordoba-fPYJeMmYWM4-unsplash_tp7ula.jpg",
                  "https://res.cloudinary.com/dlpbxzb7o/image/upload/v1661410820/seeds/atelier-unes-aYwJeBcFEQQ-unsplash_u8qket.jpg",
                  "https://res.cloudinary.com/dlpbxzb7o/image/upload/v1661410823/seeds/jonathan-borba-lsGZlrdvd_c-unsplash_wydla6.jpg",
                  "https://res.cloudinary.com/dlpbxzb7o/image/upload/v1661410831/seeds/olga-guryanova-Th-i7Z1ufK8-unsplash_oxbdy3.jpg"]

artists_names = ["Cory Marquardt",
                 "PeteBronsson",
                 "Marie",
                 "RembrandtWasBoringg",
                 "Ana Maradona"]

artists_emails = ["cory@marquardt.com",
                  "petebronsson@gmail.com",
                  "marie@hotmail.de",
                  "rembrandthater1990@gmail.com",
                  "ana@maradona.com"]

def make_random_user(artist_email)
  # makes a new random user and returns the user
  user = User.new
  user.email = artist_email
  user.password = '123456'
  user.save
  puts "user_id: #{user.id} - User created: - #{user.email} - #{user.password} - saved?: - #{user.save}"
  user
end

def make_random_artist_profile(random_user_id, artist_photo, artist_name)
  # find the artists profile, because it was already created at user creation
  artist_profile = Profile.find(random_user_id)
  artist_profile.name = artist_name
  artist_profile.bio = Faker::Lorem.paragraph(sentence_count: 10)
  artist_profile.photo.attach(io: artist_photo, filename: "profilepic.jpg", content_type: "image/jpg")
  artist_profile.user_id = random_user_id
  artist_profile.save
  artist_profile.set_name_to_user
  puts "user_id: #{artist_profile.user_id} - ArtistProfile created: #{artist_profile.name}  - saved?: #{artist_profile.save} - id: #{artist_profile.id}"
end

def make_random_artwork(random_user_id, artwork_photo)
  artwork = Artwork.new(title: Faker::Emotion.noun.capitalize, description: Faker::Lorem.paragraph(sentence_count: 5))
  artwork.photos.attach(io: artwork_photo, filename: artwork.title, content_type: "image/jpg")
  artwork.user_id = random_user_id
  artwork.price = Faker::Number.between(from: 400, to: 3000)
  artwork.shipping_costs = 9.99
  artwork.save
  puts "user_id: #{artwork.user_id} - Artwork created: #{artwork.title}  - saved?: #{artwork.save} - id: #{artwork.id}"
  puts ""
end

puts "populating database..."
n = 0
5.times do
  artist_name = artists_names[n]
  artist_email = artists_emails[n]
  # makes a random user an assigns its it to random_user_id
  random_user_id = make_random_user(artist_email).id

  artwork_photo = URI.open(artworks_photos[n])
  artist_photo = URI.open(artists_photos[n])


  make_random_artist_profile(random_user_id, artist_photo, artist_name)
  make_random_artwork(random_user_id, artwork_photo)

  n += 1
end
