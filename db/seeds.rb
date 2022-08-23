require "open-uri"
# require "faker"

######### Artworks seeds:
artworks = ["https://upload.wikimedia.org/wikipedia/en/c/c9/Albert_Gleizes%2C_1912%2C_Les_ponts_de_Paris_%28Passy%29%2C_The_Bridges_of_Paris%2C_oil_on_canvas%2C_60.5_x_73.2_cm%2C_Museum_Moderner_Kunst_%28mumok%29%2C_Vienna_%28black_and_white%29.jpg",
            "https://upload.wikimedia.org/wikipedia/en/1/13/Albert_Gleizes%2C_1915%2C_Composition_pour_Jazz%2C_oil_on_cardboard%2C_73_x_73_cm%2C_Solomon_R._Guggenheim_Museum%2C_New_York_DSC00542.jpg",
            "https://upload.wikimedia.org/wikipedia/en/e/eb/Alexander-II-monument3.jpg",
            "https://upload.wikimedia.org/wikipedia/en/b/b5/Babys_first_cradle_Strindberg.jpg",
            "https://upload.wikimedia.org/wikipedia/en/c/c5/AugustusKollnerNearAndBelowBedfordPA1840.jpg",
            "https://upload.wikimedia.org/wikipedia/en/9/9a/Augustus_Keppel_by_Thomas_Hickey.jpg",
            "https://upload.wikimedia.org/wikipedia/en/c/cc/Barbour-hilden.jpg",
            "https://upload.wikimedia.org/wikipedia/en/5/59/Otto_Dix_Sy_von_Harden.jpg",
            "https://upload.wikimedia.org/wikipedia/en/2/25/P.G._Wodehouse_-_My_Man_Jeeves_-_1st_American_edition_%281920_printing%29.jpg"]

def make_random_user
  user = User.new
  user.email = Faker::Internet.email
  user.password = '#$taawktljasktlw4aaglj'
  user.save!
  user
end

artworks.each_with_index do |artwork, index|
  file = URI.open(artwork)
  artwork = Artwork.new(title: "ART", description: "this is the description of this cool artwork")
  artwork.photo.attach(io: file, filename: "art.jpg", content_type: "image/png")
  artwork.user_id = make_random_user.id
  artwork.save
end
