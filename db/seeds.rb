# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
categorys = Category.create ([{name: 'Bikes'},{name: 'Beach rents'},{name: 'Camps & Tours'},{name: 'Winter rents'}])
citys = City.create([{name: 'Lviv'}, {name: 'Ivano-Frankivsk'},{name: 'Rivne'}, {name: 'New York'}, {name: 'Kyiv'}, {name: 'Los-Angeles'} ])
