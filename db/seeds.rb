# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times.each do |a|
    picture = {
        title: "////// #{a}",
        description: "Makersleeve is the first sleeve for smart devices that can be made on demand, anywhere in the world, by anyone. Designed following the belief that no products should be mass produced, but created specifically for each customer in exactly the way you need it.

        Unlike your average laptop sleeve, a Makersleeve is only made after it is sold. Due to it’s clever design, it can be made in a matter of minutes anywhere in the world using nothing but fabric and a laser cutter. The digital design automatically transforms to perfectly fit your device."
    }
    Picture.create!(picture)
end