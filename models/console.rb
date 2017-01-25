require('pry-byebug')

require_relative('album')
require_relative('artist')

artist1 = Artist.new({'name' => 'The Rolling Stones'})
artist2 = Artist.new({'name' => 'Elvis Costello and The Attractions'})

artist1.save
artist2.save

album1 = Album.new({'title' => 'Voodoo Lounge', 'genre' => 'Rock', 'artist_id' => artist1.id })
album2 = Album.new({'title' => 'Bridges to Babylon', 'genre' => 'Rock', 'artist_id' => artist1.id })
album3 = Album.new({'title' => 'Emotional Rescue', 'genre' => 'Rock', 'artist_id' => artist1.id })
album4 = Album.new({'title' => 'Almost Blue', 'genre' => 'Country', 'artist_id' => artist2.id })



binding.pry

nil