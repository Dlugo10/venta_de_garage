# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.destroy_all

100.times do 
  product = Product.create(
    title: ['Mueble', 'Silla', 'Cama', 'Ipad', 'Ropa', 'Velador', 'Libro'].sample,
    price: rand(30..600),
    dimensions: '30cm x 40cm',
    age: rand(1..10)
  )

  product.save
end