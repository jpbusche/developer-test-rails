# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis tempor finibus metus et porta. Morbi ullamcorper lacus porttitor hendrerit vehicula. Nulla elementum ex massa, ut imperdiet nunc congue nec."
@webpage1 = Webpage.create(title: "Google", description: "Site de pesquisa", body: text, author: "Larry Page", url: "www.google.com.br")
@webpage2 = Webpage.create(title: "Facebook", description: "Rede Social", body: text, author: "Mark Zuckerberg", url: "facebook.com")
@webpage3 = Webpage.create(title: "Orkut", description: "Rede Social", body: text, author: "Orkut Büyükkökten", url: "www.orkut.com.br")
@webpage4 = Webpage.create(title: "Bing", description: "Site de pesquisa", body: text, author: "Steve Ballmer", url: "www.bing.com")
