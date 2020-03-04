# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'nokogiri'

file      = File.open('./lib/food.xml')
document  = Nokogiri::XML(file)

document.search('//brick').each do |brick|
  gpc_brick = brick.attribute('code').value
  brick_description = brick.attribute('text').value
  ProdCategory.create([
    {
      gpc_brick: gpc_brick,
      brick_description: brick_description
   }])

end
