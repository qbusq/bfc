# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ProdCategory.destroy_all

require 'nokogiri'

file      = File.open('./lib/food.xml')
document  = Nokogiri::XML(file)
array = []

document.search('//brick').each do |brick|
  gpc_brick = brick.attribute('code').value
  brick_description = brick.attribute('text').value
   prod_c = ProdCategory.create(
      gpc_brick: gpc_brick,
      brick_description: brick_description
   )
  array << prod_c if gpc_brick == '10000270' || gpc_brick == '10000204'
end

ProdCategory.where gpc_brick: ['10000204', '10000270']
# ==> the id's are 233 and 236

require 'json'
require 'open-uri'
url = 'https://restcountries.eu/rest/v2/all'
user_serialized = open(url).read
user = JSON.parse(user_serialized)

all_countries = []
user.each do |a|
all_countries << a["name"]
end

# User.destroy_all
# Offer.destroy_all
# OfferLine.destroy_all
# Product.destroy_all
# Certificate.destroy_all
# CompanyCertificate.destroy_all
# ProductCertificate.destroy_all

# users = User.create([
#   {
#     email: 'seller1@gmail.com',
#     password: '123456abc!',
#     company_name: 'Veggie Company',
#     address: 'Veldstraat 10, Roeselare',
#     country: 'Belgium',
#     user_type: 'processor',
#     seller: true
#  },
#   {
#     email: 'seller2@gmail.com',
#     password: '654321abc!',
#     company_name: 'Fruity & Co',
#     address: 'Rue de fruits, 13, Arlon',
#     country: 'Belgium',
#     user_type: 'processor',
#     seller: true
#  },
#   {
#     email: 'buyer1@gmail.com',
#     password: '147852abc!',
#     company_name: 'La Biscuiterie',
#     address: 'Rue du Biscuit 5, Lyon',
#     country: 'France',
#     user_type: 'processor',
#     seller: false
#  },
#   {
#     email: 'buyer2@gmail.com',
#     password: '369852abc!',
#     company_name: 'Gastro Gut Essen',
#     address: 'Ludwigstrasse 11, Hamburg',
#     country: 'Germany',
#     user_type: 'food service',
#     seller: false
#  }
# ])

# offers = Offer.create([
#   {
#     from_user: 4,
#     date: Date.new(2020,3,3),
#     start_date: Date.new(2020,7,1),
#     end_date: Date.new(2020,6,30),
#     remark: 'Please consult the general terms and conditions that apply to this offer request on our website.',
#     status: 'requested'
#   },
#   {
#     from_user: 1,
#     to_user: 4,
#     date: Date.new(2020,3,5),
#     start_date: Date.new(2020,7,1),
#     end_date: Date.new(2020,6,30),
#     remark: 'Offer subject to unsold',
#     offer_request_id: 1,
#     follow_up_on_offer: 1,
#     status: 'sent'
#   },
#   {
#     from_user: 2,
#     to_user: 4,
#     date: Date.new(2020,3,6),
#     start_date: Date.new(2020,7,1),
#     end_date: Date.new(2020,6,30),
#     remark: 'Offer subject to unsold',
#     offer_request_id: 1,
#     follow_up_on_offer: 1,
#     status: 'sent'
#   },
#   {
#     from_user: 4,
#     to_user: 1,
#     date: Date.new(2020,3,15),
#     start_date: Date.new(2020,7,1),
#     end_date: Date.new(2020,6,30),
#     remark: 'Please consult the general terms and conditions that apply to this offer request on our website.',
#     offer_request_id: 1,
#     follow_up_on_offer: 2,
#     status: 'sent'
#   },
#   {
#     from_user: 1,
#     to_user: 4,
#     date: Date.new(2020,3,17),
#     start_date: Date.new(2020,7,1),
#     end_date: Date.new(2020,6,30),
#     remark: 'Offer subject to unsold',
#     offer_request_id: 1,
#     follow_up_on_offer: 4,
#     status: 'sent'
#   },
#   {
#     from_user: 4,
#     to_user: 1,
#     date: Date.new(2020,3,20),
#     start_date: Date.new(2020,7,1),
#     end_date: Date.new(2020,6,30),
#     remark: 'Please consult the general terms and conditions that apply to this offer request on our website.',
#     offer_request_id: 1,
#     follow_up_on_offer: 5,
#     status: 'accepted'
#   },
#   {
#     from_user: 1,
#     to_user: 4,
#     date: Date.new(2020,3,21),
#     start_date: Date.new(2020,7,1),
#     end_date: Date.new(2020,6,30),
#     remark: 'Offer subject to unsold',
#     offer_request_id: 1,
#     follow_up_on_offer: 6,
#     status: 'confirmed'
#   },
#   {
#     from_user: 2,
#     to_user: 3,
#     date: Date.new(2020,3,9),
#     start_date: Date.new(2020,4,1),
#     end_date: Date.new(2020,4,30),
#     remark: 'Offer subject to unsold',
#     status: 'sent'
#   }
# ])

# offer_lines = OfferLine.create([
#   {
#     offer_id: 1,
#     product_id: 1,
#     quantity_in_tons: 100,
#     target_offer_line_id: 1
#   },
#   {
#     offer_id: 1,
#     product_id: 2,
#     quantity_in_tons: 60,
#     target_offer_line_id: 2
#   },
#   {
#     offer_id: 1,
#     product_id: 3,
#     quantity_in_tons: 25,
#     target_offer_line_id: 3
#   },
#   {
#     offer_id: 2,
#     product_id: 4,
#     quantity_in_tons: 100,
#     target_offer_line_id: 1,
#     alternative_to_target: false,
#     price: 0.69
#   },
#   {
#     offer_id: 2,
#     product_id: 5,
#     quantity_in_tons: 60,
#     target_offer_line_id: 2,
#     alternative_to_target: true,
#     price: 0.55
#   },
#   {
#     offer_id: 2,
#     product_id: 3,
#     quantity_in_tons: 25,
#     target_offer_line_id: 3,
#     alternative_to_target: false,
#     price: 0.62
#   },
#   {
#     offer_id: 3,
#     product_id: 6,
#     quantity_in_tons: 100,
#     target_offer_line_id: 1,
#     alternative_to_target: false,
#     price: 0.78
#   },
#   {
#     offer_id: 3,
#     product_id: 2,
#     quantity_in_tons: 60,
#     target_offer_line_id: 2,
#     alternative_to_target: false,
#     price: 0.62
#   },
#   {
#     offer_id: 3,
#     product_id: 7,
#     quantity_in_tons: 25,
#     target_offer_line_id: 3,
#     alternative_to_target: true,
#     price: 0.5
#   },
#   {
#     offer_id: 4,
#     product_id: 4,
#     quantity_in_tons: 100,
#     target_offer_line_id: 1,
#     alternative_to_target: false,
#     price: 0.66
#   },
#   {
#     offer_id: 4,
#     product_id: 2,
#     quantity_in_tons: 60,
#     target_offer_line_id: 2,
#     alternative_to_target: false,
#     price: 0.5
#   },
#   {
#     offer_id: 4,
#     product_id: 3,
#     quantity_in_tons: 25,
#     target_offer_line_id: 3,
#     alternative_to_target: false,
#     price: 0.6
#   },
#   {
#     offer_id: 5,
#     product_id: 4,
#     quantity_in_tons: 100,
#     target_offer_line_id: 1,
#     alternative_to_target: false,
#     price: 0.68
#   },
#   {
#     offer_id: 5,
#     product_id: 2,
#     quantity_in_tons: 60,
#     target_offer_line_id: 2,
#     alternative_to_target: false,
#     price: 0.65
#   },
#   {
#     offer_id: 5,
#     product_id: 5,
#     quantity_in_tons: 60,
#     target_offer_line_id: 2,
#     alternative_to_target: true,
#     price: 0.51
#   },
#   {
#     offer_id: 5,
#     product_id: 3,
#     quantity_in_tons: 25,
#     target_offer_line_id: 3,
#     alternative_to_target: false,
#     price: 0.65
#   },
#   {
#     offer_id: 6,
#     product_id: 4,
#     quantity_in_tons: 100,
#     target_offer_line_id: 1,
#     alternative_to_target: false,
#     price: 0.65
#   },
#   {
#     offer_id: 6,
#     product_id: 5,
#     quantity_in_tons: 60,
#     target_offer_line_id: 2,
#     alternative_to_target: true,
#     price: 0.5
#   },
#   {
#     offer_id: 6,
#     product_id: 3,
#     quantity_in_tons: 25,
#     target_offer_line_id: 3,
#     alternative_to_target: false,
#     price: 0.63
#   },
#   {
#     offer_id: 7,
#     product_id: 4,
#     quantity_in_tons: 100,
#     target_offer_line_id: 1,
#     alternative_to_target: false,
#     price: 0.65
#   },
#   {
#     offer_id: 7,
#     product_id: 5,
#     quantity_in_tons: 60,
#     target_offer_line_id: 2,
#     alternative_to_target: true,
#     price: 0.5
#   },
#   {
#     offer_id: 7,
#     product_id: 3,
#     quantity_in_tons: 25,
#     target_offer_line_id: 3,
#     alternative_to_target: false,
#     price: 0.63
#   },
#   {
#     offer_id: 8,
#     product_id: 8,
#     quantity_in_tons: 150,
#     price: 2.45
#   },
#   {
#     offer_id: 8,
#     product_id: 9,
#     quantity_in_tons: 240,
#     price: 1.95
#   }
# ])


# products = Product.create([
#   {
#     name: 'Frozen peas – extra small',
#     description: 'IQF peas <8mm',
#     private_label: false,
#     weight_in_kg: 2.5,
#     nr_per_sku: 4,
#     user_id: 4,
#     prod_cat_id: 1,
#     prod_specification_pdf: 'someurl1'
#   },
#   {
#     name: 'Frozen carrot dices',
#     description: 'IQF carrot dices 10x10mm',
#     brand: ' GutChef',
#     private_label: true,
#     weight_in_kg: 2.5,
#     nr_per_sku: 4,
#     user_id: 4,
#     prod_cat_id: 1,
#     prod_specification_pdf: 'someurl2'
#   },
#   {
#     name: 'Frozen broken beans',
#     description: 'IQF green beans cut 26mm',
#     brand: 'GutChef',
#     private_label: true,
#     weight_in_kg: 2.5,
#     nr_per_sku: 4,
#     user_id: 4,
#     prod_cat_id: 1,
#     prod_specification_pdf: 'someurl3'
#   },
#   {
#     name: 'Frozen garden peas – extra small',
#     description: 'IQF garden peas: 7 - 8mm',
#     brand: 'Veggie',
#     private_label: false,
#     weight_in_kg: 2.5,
#     nr_per_sku: 4,
#     user_id: 1,
#     prod_cat_id: 1,
#     prod_specification_pdf: 'someurl4'
#   },
#   {
#     name: 'Frozen carrot cubes',
#     description: 'IQF carrots diced 10x10mm',
#     brand: 'Veggie',
#     private_label: false,
#     weight_in_kg: 5,
#     nr_per_sku: 2,
#     user_id: 1,
#     prod_cat_id: 1,
#     prod_specification_pdf: 'someurl5'
#   },
#   {
#     name: 'Petit pois',
#     description: 'Frozen peas extra small (7.5 – 8 mm)',
#     brand: 'Fruity',
#     private_label: false,
#     weight_in_kg: 2.5,
#     nr_per_sku: 4,
#     user_id: 2,
#     prod_cat_id: 1,
#     prod_specification_pdf: 'someurl6'
#   },
#   {
#     name: 'Frozen cut beans',
#     description: 'IQF beans cut 26mm',
#     brand: 'Fruity',
#     private_label: false,
#     weight_in_kg: 10,
#     nr_per_sku: 1,
#     user_id: 2,
#     prod_cat_id: 1,
#     prod_specification_pdf: 'someurl7'
#   },
#   {
#     name: 'IQF bio sourcherries',
#     description: 'IQF bio sourcherries halves pitless',
#     weight_in_kg: 25,
#     nr_per_sku: 1,
#     user_id: 2,
#     prod_cat_id: 2,
#     prod_specification_pdf: 'someurl8'
#   },
#   {
#     name: 'IQF bio blueberries',
#     description: 'IQF bio blueberries B quality',
#     weight_in_kg: 10,
#     nr_per_sku: 1,
#     user_id: 2,
#     prod_cat_id: 2,
#     prod_specification_pdf: 'someurl9'
#   }
# ])


# certificates = Certificate.create([
#   {
#     name: 'BRC'
#   },
#   {
#     name: 'ISO'
#   },
#   {
#     name: 'IFS'
#   },
#   {
#     name: 'Halal'
#   },
#   {
#     name: 'Kosher'
#   },
#   {
#     name: 'bio'
#   },
#   {
#     name: 'organic'
#   },
#   {
#     name: 'non-GMO'
#   }
# ])


# company_certificates = CompanyCertificate.create([
#   {
#     user_id: 1,
#     certificate_id: 1
#   },
#   {
#     user_id: 1,
#     certificate_id: 2
#   },
#   {
#     user_id: 1,
#     certificate_id: 3
#   },
#   {
#     user_id: 1,
#     certificate_id: 4
#   },
#   {
#     user_id: 1,
#     certificate_id: 5
#   },
#   {
#     user_id: 2,
#     certificate_id: 1
#   },
#   {
#     user_id: 2,
#     certificate_id: 3
#   },
#   {
#     user_id: 3,
#     certificate_id: 2
#   },
#   {
#     user_id: 3,
#     certificate_id: 4
#   },
#   {
#     user_id: 3,
#     certificate_id: 5
#   }
# ])


# product_certificates = ProductCertificate.create([
#   {
#     product_id: 1,
#     certificate_id: 5
#   },
#   {
#     product_id: 1,
#     certificate_id: 7
#   },
#   {
#     product_id: 1,
#     certificate_id: 8
#   },
#   {
#     product_id: 2,
#     certificate_id: 8
#   },
#   {
#     product_id: 3,
#     certificate_id: 6
#   },
#   {
#     product_id: 3,
#     certificate_id: 8
#   },
#   {
#     product_id: 4,
#     certificate_id: 5
#   },
#   {
#     product_id: 4,
#     certificate_id: 7
#   },
#   {
#     product_id: 4,
#     certificate_id: 8
#   },
#   {
#     product_id: 5,
#     certificate_id: 8
#   },
#   {
#     product_id: 6,
#     certificate_id: 5
#   },
#   {
#     product_id: 6,
#     certificate_id: 7
#   },
#   {
#     product_id: 6,
#     certificate_id: 8
#   },
#   {
#     product_id: 7,
#     certificate_id: 8
#   },
#   {
#     product_id: 8,
#     certificate_id: 6
#   },
#   {
#     product_id: 8,
#     certificate_id: 8
#   },
#   {
#     product_id: 9,
#     certificate_id: 6
#   },
#   {
#     product_id: 9,
#     certificate_id: 8
#   }
# ])



