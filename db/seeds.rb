# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Offer.destroy_all
OfferLine.destroy_all
Product.destroy_all
Certificate.destroy_all
CompanyCertificate.destroy_all
ProductCertificate.destroy_all

ProdCategory.destroy_all
require 'nokogiri'

file      = File.open('./lib/food.xml')
document  = Nokogiri::XML(file)
array = []

document.search('//brick').each do |brick|
  gpc_brick = brick.attribute('code').value
  brick_description = brick.attribute('text').value
  p ProdCategory.create!([
    {
      gpc_brick: gpc_brick.to_i,
     brick_description: brick_description
   }])
end

ProdCategory.where gpc_brick: ['10000204', '10000270']
# ==> the id's are 233 and 236

require 'json'
require 'open-uri'
url = 'https://restcountries.eu/rest/v2/all'
user_serialized = open(url).read
user = JSON.parse(user_serialized)

@all_countries = []
user.each do |a|
@all_countries << a["name"]
end

seller1 = User.create!(
  {
    email: 'seller1@gmail.com',
    password: '123456abc!',
    company_name: 'Veggie Company',
    address: '38 Parkstraat, Roeselare',
    country: 'BE',
    user_type: 'processor',
    seller: true
 })

seller2 = User.create!(
  {
    email: 'seller2@gmail.com',
    password: '654321abc!',
    company_name: 'Fruity & Co',
    address: '247 Chemin des Espagnols, 13, Arlon',
    country: 'BE',
    user_type: 'processor',
    seller: true
 })

seller3 = User.create!(
  {
    email: 'seller3@gmail.com',
    password: '98765abc!',
    company_name: 'All Things Veggie',
    address: '235 Avenue Lacassagne, Lyon',
    country: 'FR',
    user_type: 'processor',
    seller: true
 })

seller4 = User.create!(
  {
    email: 'seller4@gmail.com',
    password: 'aspargus1234',
    company_name: 'The Green Company',
    address: '31 Ransbergstraat, Linter',
    country: 'BE',
    user_type: 'processor',
    seller: true
 })

seller5 = User.create!(
  {
    email: 'seller5@gmail.com',
    password: 'aspargus1234',
    company_name: 'Fresh and Frozen Co.',
    address: '11 Rue de Baudémont, Ittre',
    country: 'BE',
    user_type: 'processor',
    seller: true
 })

seller6 = User.create!(
  {
    email: 'seller6@gmail.com',
    password: 'aspargus1234',
    company_name: 'Veggies and More',
    address: '45 Verrekijker, Wingene',
    country: 'BE',
    user_type: 'processor',
    seller: true
 })

seller7 = User.create!(
  {
    email: 'seller7@gmail.com',
    password: 'aspargus1234',
    company_name: 'Produce and Flowers',
    address: '24 Resteleustraat, Geraardsbergen',
    country: 'BE',
    user_type: 'processor',
    seller: true
 })

buyer1 = User.create!(
  {
    email: 'buyer1@gmail.com',
    password: '147852abc!',
    company_name: 'La Biscuitrie',
    address: '14 Rue Pierre Robin, Lyon',
    country: 'FR',
    user_type: 'processor',
    seller: false
 })

buyer2 = User.create!(
  {
    email: 'buyer2@gmail.com',
    password: '369852abc!',
    company_name: 'Continental Foods',
    address: '18 Rue du Boulet, Brussels',
    country: 'BE',
    user_type: 'food service',
    seller: false
 })

p seller1
p seller2
p buyer1
p buyer2

puts 'Creating original offers_'
p buyer2[:company_name]

p offer_request = Offer.create!(
    from_user: buyer2,
    title: buyer2[:company_name] + ' - Offer request',
    date: Date.new(2020,3,3),
    start_date: Date.new(2020,7,1),
    end_date: Date.new(2021,6,30),
    remark: 'Please consult the general terms and conditions that apply to this offer request on our website.',
    status: 'requested'
   )

p offer_request2 = Offer.create!(
    from_user: buyer2,
    title: buyer2[:company_name] + ' - Offer request',
    date: Date.new(2020,3,7),
    start_date: Date.new(2020,5,1),
    end_date: Date.new(2021,6,30),
    country: 'FR',
    remark: 'Please consult the general terms and conditions that apply to this offer request on our website.',
    status: 'requested'
   )

p offer1 = Offer.create!(
    from_user: seller1,
    to_user: buyer2,
    title: buyer2[:company_name] + ' - Offer request: Offer ' + seller1[:company_name],
    date: Date.new(2020,3,5),
    start_date: Date.new(2020,7,1),
    end_date: Date.new(2021,6,30),
    country: 'BE',
    remark: 'Offer subject to unsold',
    offer_request: offer_request,
    follow_up_on_offer: offer_request,
    status: 'sent'
   )
p offer2 = Offer.create!(
    from_user: seller2,
    to_user: buyer2,
    title: buyer2[:company_name] + ' - Offer request: Offer ' + seller2[:company_name],
    date: Date.new(2020,3,6),
    start_date: Date.new(2020,7,1),
    end_date: Date.new(2021,6,30),
    country: 'BE',
    remark: 'Offer subject to unsold',
    offer_request: offer_request,
    follow_up_on_offer: offer_request,
    status: 'sent'
   )

p counteroffer1 = Offer.create!(
    from_user: buyer2,
    to_user: seller1,
    title: buyer2[:company_name] + ' - Offer request: Counteroffer to ' + seller1[:company_name],
    date: Date.new(2020,3,15),
    start_date: Date.new(2020,7,1),
    end_date: Date.new(2021,6,30),
    remark: 'Please consult the general terms and conditions that apply to this offer request on our website.',
    offer_request: offer_request,
    follow_up_on_offer: offer1,
    status: 'sent'
   )

p renewedoffer1 = Offer.create!(
    from_user: seller1,
    to_user: buyer2,
    title: buyer2[:company_name] + ' - Offer request: Renewed offer ' + seller1[:company_name],
    date: Date.new(2020,3,17),
    start_date: Date.new(2020,7,1),
    end_date: Date.new(2021,6,30),
    country: 'BE',
    remark: 'Offer subject to unsold',
    offer_request: offer_request,
    follow_up_on_offer: counteroffer1,
    status: 'sent'
   )
p counteroffer2 = Offer.create!(
    from_user: buyer2,
    to_user: seller1,
    title: buyer2[:company_name] + ' - Offer request: Accepted offer ' + seller1[:company_name],
    date: Date.new(2020,3,20),
    start_date: Date.new(2020,7,1),
    end_date: Date.new(2021,6,30),
    country: 'BE',
    remark: 'Please consult the general terms and conditions that apply to this offer request on our website.',
    offer_request: offer_request,
    follow_up_on_offer: renewedoffer1,
    status: 'accepted'
   )

p renewedoffer2 = Offer.create!(
    from_user: seller1,
    to_user: buyer2,
    title: buyer2[:company_name] + ' - Contracted supplier: ' + seller1[:company_name],
    date: Date.new(2020,3,21),
    start_date: Date.new(2020,7,1),
    end_date: Date.new(2021,6,30),
    country: 'BE',
    remark: 'The general terms and conditions of the buyer apply.',
    offer_request: offer_request,
    follow_up_on_offer: counteroffer2,
    status: 'confirmed'
   )

p offer3 = Offer.create!(
    from_user: seller2,
    to_user: buyer1,
    title: seller2[:company_name] + ' - Spontaneous offer',
    date: Date.new(2020,3,9),
    country: 'BE',
    start_date: Date.new(2020,4,1),
    end_date: Date.new(2020,4,30),
    remark: 'Offer subject to unsold',
    status: 'sent'
   )

p counteroffer3 = Offer.create!(
    from_user: buyer1,
    to_user: seller2,
    title: seller2[:company_name] + ' - Spontaneous offer accepted by ' + buyer1[:company_name],
    date: Date.new(2020,3,10),
    start_date: Date.new(2020,4,1),
    end_date: Date.new(2020,4,30),
    remark: 'Offer accepted under the general terms and conditions of the buyer.',
    follow_up_on_offer: offer3,
    status: 'accepted'
   )

p renewedoffer3 = Offer.create!(
    from_user: seller2,
    to_user: buyer1,
    title: buyer1[:company_name] + ' - Contracted supplier: ' + seller2[:company_name],
    date: Date.new(2020,3,10),
    start_date: Date.new(2020,4,1),
    end_date: Date.new(2020,4,30),
    remark: 'Contract valid under the general terms and conditions of the buyer.',
    follow_up_on_offer: counteroffer3,
    status: 'confirmed'
   )


p peas1 = Product.create!(
    name: 'Frozen peas – extra small',
    description: 'IQF peas <8mm',
    private_label: false,
    weight_in_kg: 2.5,
    nr_per_sku: 4,
    user: buyer2,
    prod_category_id: 233
   )

p carrots1 = Product.create!(
    name: 'Frozen carrot dices',
    description: 'IQF carrot dices 10x10mm',
    brand: ' GutChef',
    private_label: true,
    weight_in_kg: 2.5,
    nr_per_sku: 4,
    user: buyer2,
    prod_category_id: 233
   )

p beans1 = Product.create(
    name: 'Frozen broken beans',
    description: 'IQF green beans cut 26mm',
    brand: 'GutChef',
    private_label: true,
    weight_in_kg: 2.5,
    nr_per_sku: 4,
    prod_category_id: 233,
    user: buyer2
   )

p peas2 = Product.create(
    name: 'Frozen garden peas – extra small',
    description: 'IQF garden peas: 7 - 8mm',
    brand: 'Veggie',
    private_label: false,
    weight_in_kg: 2.5,
    nr_per_sku: 4,
    user: seller1,
    prod_category_id: 233
   )

p carrots2 = Product.create(
    name: 'Frozen carrot cubes',
    description: 'IQF carrots diced 10x10mm',
    brand: 'Veggie',
    private_label: false,
    weight_in_kg: 5,
    nr_per_sku: 2,
    user: seller1,
    prod_category_id: 233
   )

p peas3 = Product.create(
    name: 'Petit pois',
    description: 'Frozen peas extra small (7.5 – 8 mm)',
    brand: 'Fruity',
    private_label: false,
    weight_in_kg: 2.5,
    nr_per_sku: 4,
    user: seller2,
    prod_category_id: 233
   )

p beans2 = Product.create(
    name: 'Frozen cut beans',
    description: 'IQF beans cut 26mm',
    brand: 'Fruity',
    private_label: false,
    weight_in_kg: 10,
    nr_per_sku: 1,
    user: seller2,
    prod_category_id: 233
   )

p cherries = Product.create(
    name: 'IQF bio sourcherries',
    description: 'IQF bio sourcherries halves pitless',
    weight_in_kg: 25,
    nr_per_sku: 1,
    user: seller2,
    prod_category_id: 236
   )

p berries = Product.create(
    name: 'IQF bio blueberries',
    description: 'IQF bio blueberries B quality',
    weight_in_kg: 10,
    nr_per_sku: 1,
    user: seller2,
    prod_category_id: 236
   )

p offer_line1 = OfferLine.create!(
    offer: offer_request,
    product: peas1,
    quantity_in_tons: 100
   )

p offer_line2 = OfferLine.create!(
    offer: offer_request,
    product: carrots1,
    quantity_in_tons: 60
   )

p offer_line3 = OfferLine.create!(
    offer: offer_request,
    product: beans1,
    quantity_in_tons: 25
   )

p offer_line4 = OfferLine.create!(
    offer: offer1,
    product: peas2,
    quantity_in_tons: 100,
    target_offer_line: offer_line1,
    alternative_to_target: false,
    price: 0.69
   )

p offer_line5 = OfferLine.create!(
    offer: offer1,
    product: carrots2,
    quantity_in_tons: 60,
    target_offer_line: offer_line2,
    alternative_to_target: true,
    price: 0.55
   )

p offer_line6 = OfferLine.create!(
    offer: offer1,
    product: beans1,
    quantity_in_tons: 25,
    target_offer_line: offer_line3,
    alternative_to_target: false,
    price: 0.62
   )

p offer_line7 = OfferLine.create!(
    offer: offer2,
    product: peas3,
    quantity_in_tons: 100,
    target_offer_line: offer_line1,
    alternative_to_target: false,
    price: 0.78
   )

p offer_line8 = OfferLine.create!(
    offer: offer2,
    product: carrots1,
    quantity_in_tons: 60,
    target_offer_line: offer_line2,
    alternative_to_target: false,
    price: 0.62
   )

p offer_line9 = OfferLine.create!(
    offer: offer2,
    product: beans2,
    quantity_in_tons: 25,
    target_offer_line: offer_line3,
    alternative_to_target: true,
    price: 0.5
   )

p offer_line10 = OfferLine.create!(
    offer: counteroffer1,
    product: peas2,
    quantity_in_tons: 100,
    target_offer_line: offer_line1,
    alternative_to_target: false,
    price: 0.66
   )

p offer_line11 = OfferLine.create!(
    offer: counteroffer1,
    product: carrots1,
    quantity_in_tons: 60,
    target_offer_line: offer_line2,
    alternative_to_target: false,
    price: 0.5
   )

p offer_line12 = OfferLine.create!(
    offer: counteroffer1,
    product: beans1,
    quantity_in_tons: 25,
    target_offer_line: offer_line3,
    alternative_to_target: false,
    price: 0.6
   )

p offer_line13 = OfferLine.create!(
    offer: renewedoffer1,
    product: peas2,
    quantity_in_tons: 100,
    target_offer_line: offer_line1,
    alternative_to_target: false,
    price: 0.68
   )

p offer_line14 = OfferLine.create!(
    offer: renewedoffer1,
    product: carrots1,
    quantity_in_tons: 60,
    target_offer_line: offer_line2,
    alternative_to_target: false,
    price: 0.65
   )

p offer_line15 = OfferLine.create!(
    offer: renewedoffer1,
    product: carrots2,
    quantity_in_tons: 60,
    target_offer_line: offer_line2,
    alternative_to_target: true,
    price: 0.51
   )

p offer_line16 = OfferLine.create!(
    offer: renewedoffer1,
    product: beans1,
    quantity_in_tons: 25,
    target_offer_line: offer_line3,
    alternative_to_target: false,
    price: 0.65
   )

p offer_line17 = OfferLine.create!(
    offer: counteroffer2,
    product: peas2,
    quantity_in_tons: 100,
    target_offer_line: offer_line1,
    alternative_to_target: false,
    price: 0.65
   )

p offer_line18 = OfferLine.create!(
    offer: counteroffer2,
    product: carrots2,
    quantity_in_tons: 60,
    target_offer_line: offer_line2,
    alternative_to_target: true,
    price: 0.5
   )

p offer_line19 = OfferLine.create!(
    offer: counteroffer2,
    product: beans1,
    quantity_in_tons: 25,
    target_offer_line: offer_line3,
    alternative_to_target: false,
    price: 0.63
   )

p offer_line20 = OfferLine.create!(
    offer: renewedoffer2,
    product: peas2,
    quantity_in_tons: 100,
    target_offer_line: offer_line1,
    alternative_to_target: false,
    price: 0.65
   )

p offer_line21 = OfferLine.create!(
    offer: renewedoffer2,
    product: carrots2,
    quantity_in_tons: 60,
    target_offer_line: offer_line2,
    alternative_to_target: true,
    price: 0.5
   )

p offer_line22 = OfferLine.create!(
    offer: renewedoffer2,
    product: beans1,
    quantity_in_tons: 25,
    target_offer_line: offer_line3,
    alternative_to_target: false,
    price: 0.63
   )

p offer_line23 = OfferLine.create!(
    offer: offer3,
    product: cherries,
    quantity_in_tons: 150,
    price: 2.45
   )

p offer_line24 = OfferLine.create!(
    offer: offer3,
    product: berries,
    quantity_in_tons: 240,
    price: 1.95
   )

p certificate1 = Certificate.create(
    name: 'BRC'
   )

p certificate2 = Certificate.create(
    name: 'ISO'
   )

p certificate3 = Certificate.create(
    name: 'IFS'
   )

p certificate4 = Certificate.create(
    name: 'Halal'
   )

p certificate5 = Certificate.create(
    name: 'Kosher'
   )

p certificate6 = Certificate.create(
    name: 'bio'
   )

p certificate7 = Certificate.create(
    name: 'organic'
   )

p certificate8 = Certificate.create(
    name: 'non-GMO'
   )


p company_certificates = CompanyCertificate.create!([
  {
    user: seller1,
    certificate: certificate1
  },
  {
    user: seller1,
    certificate: certificate2
  },
  {
    user: seller1,
    certificate: certificate3
  },
  {
    user: seller1,
    certificate: certificate4
  },
  {
    user: seller1,
    certificate: certificate5
  },
  {
    user: seller2,
    certificate: certificate1
  },
  {
    user: seller2,
    certificate: certificate3
  },
  {
    user: buyer1,
    certificate: certificate2
  },
  {
    user: buyer1,
    certificate: certificate4
  },
  {
    user: buyer1,
    certificate: certificate5
  }
])


p product_certificates = ProductCertificate.create!([
  {
    product: peas1,
    certificate: certificate5
  },
  {
    product: peas1,
    certificate: certificate7
  },
  {
    product: peas1,
    certificate: certificate8
  },
  {
    product: carrots1,
    certificate: certificate8
  },
  {
    product: beans1,
    certificate: certificate6
  },
  {
    product: beans1,
    certificate: certificate8
  },
  {
    product: peas2,
    certificate: certificate5
  },
  {
    product: peas2,
    certificate: certificate7
  },
  {
    product: peas2,
    certificate: certificate8
  },
  {
    product: carrots2,
    certificate: certificate8
  },
  {
    product: peas3,
    certificate: certificate5
  },
  {
    product: peas3,
    certificate: certificate7
  },
  {
    product: peas3,
    certificate: certificate8
  },
  {
    product: beans2,
    certificate: certificate8
  },
  {
    product: cherries,
    certificate: certificate6
  },
  {
    product: cherries,
    certificate: certificate8
  },
  {
    product: berries,
    certificate: certificate6
  },
  {
    product: berries,
    certificate: certificate8
  }
])



