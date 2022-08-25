require "open-uri"
# require "faker"

puts "cleaning database...."
Profile.destroy_all
Artwork.destroy_all
User.destroy_all
ArtworkTransaction.destroy_all

puts "making admin user..."
admin = User.new
admin.email = "admin@admin.com"
admin.password = "123456"
admin.save!

######### Artworks seeds:
artworks_photos = ["https://res.cloudinary.com/dlpbxzb7o/image/upload/v1661330810/seeds/7g14doghnwc1uh2sg0xfz837ftfd.jpg",
            "https://res.cloudinary.com/dlpbxzb7o/image/upload/v1661330814/seeds/r2vdzjwg4bxvesi8zhxu8q4sw526.jpg",
            "https://res.cloudinary.com/dlpbxzb7o/image/upload/v1661330817/seeds/9mrxd8ku47yurs4vc0dxmdl6d0u7.jpg",
            "https://res.cloudinary.com/dlpbxzb7o/image/upload/v1661330819/seeds/f1wkf2jp1xi17bb3nwgc33en5ycm.jpg",
                   "https://res.cloudinary.com/dlpbxzb7o/image/upload/v1661330822/seeds/tv4m6nrqg1wssnhm5rkbu2o06y7p.jpg"]

artists_photos = ["https://res.cloudinary.com/dlpbxzb7o/image/upload/v1661330812/seeds/ur89m1htbvwb2jutxt19v61cppuf.png",
                  "https://res.cloudinary.com/dlpbxzb7o/image/upload/v1661330815/seeds/ojf4fvzyq9mpfepr6hs9htmtqb2e.jpg",
                  "https://res.cloudinary.com/dlpbxzb7o/image/upload/v1661330818/seeds/k1j8ie38l8rfx8moqk434z04oxrw.jpg",
                  "https://res.cloudinary.com/dlpbxzb7o/image/upload/v1661330818/seeds/k1j8ie38l8rfx8moqk434z04oxrw.jpg",
                  "https://res.cloudinary.com/dlpbxzb7o/image/upload/v1661330818/seeds/k1j8ie38l8rfx8moqk434z04oxrw.jpg"]

def make_random_user
  # makes a new random user and returns the user
  user = User.new
  user.email = Faker::Internet.email
  user.password = '123456'
  user.save
  puts "User created: #{user.email} - #{user.password} - saved?: #{user.save}"
  user
end

def make_random_artist_profile(random_user_id, artist_photo)
  # find the artists profile, because it was already created at user creation
  artist_profile = Profile.find(random_user_id)
  artist_profile.name = "coolerKünster#{random_user_id}"
  artist_profile.bio = "lalalalalalal lorem ipsum dolor"
  artist_profile.photo.attach(io: artist_photo, filename: "profilepic.jpg", content_type: "image/jpg")
  artist_profile.user_id = random_user_id
  artist_profile.save
  puts "ArtistProfile created: #{artist_profile.name} - user_id: #{artist_profile.user_id} - saved?: #{artist_profile.save}"
end

def make_random_artwork(random_user_id, artwork_photo)
  artwork = Artwork.new(title: "ART", description: "this is the description of this cool artwork")
  artwork.photos.attach(io: artwork_photo, filename: "art.jpg", content_type: "image/jpg")
  artwork.user_id = random_user_id
  artwork.price = 950
  artwork.shipping_costs = 2.99
  artwork.save
end

puts "populating database..."
n = 0
5.times do
  random_user_id = make_random_user.id
  p "random_user_id: #{random_user_id}"

  artwork_photo = URI.open(artworks_photos[n])
  artist_photo = URI.open(artists_photos[n])

  make_random_artist_profile(random_user_id, artist_photo)
  make_random_artwork(random_user_id, artwork_photo)

  n += 1
end
