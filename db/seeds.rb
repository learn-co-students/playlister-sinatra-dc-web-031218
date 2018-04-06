# Add seed data here. Seed your database with `rake db:seed`
# require_all 'lib'

# playlister = LibraryParser.parse

LibraryParser.parse

prince = Artist.create(name: "Prince")
pop = Genre.create(name: "Pop")
rAndB = Genre.create(name: "R&B")
poplife = Song.create(name: "Pop Life")
whendovescry = Song.create(name: "When Doves Cry")

prince.songs << poplife
prince.songs << whendovescry
prince.save

whendovescry.genres << rAndB
whendovescry.genres << pop
whendovescry.save

poplife.genres << pop
poplife.save
