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
ProdCategory.destroy_all
Certificate.destroy_all
CompCert.destroy_all
ProdCert.destroy_all

users = User.create([
  {
    email: 'seller1@gmail.com',
    password: '123456abc!',
    company_name: 'Veggie Company',
    address: 'Veldstraat 10, Roeselare',
    country: 'Belgium',
    user_type: 'processor',
    seller: true
 },
  {
    email: 'seller2@gmail.com',
    password: '654321abc!',
    company_name: 'Fruity & Co',
    address: 'Rue de fruits, 13, Arlon',
    country: 'Belgium',
    user_type: 'processor',
    seller: true
 },
  {
    email: 'buyer1@gmail.com',
    password: '147852abc!',
    company_name: 'La Biscuiterie',
    address: 'Rue du Biscuit 5, Lyon',
    country: 'France',
    user_type: 'processor',
    seller: false
 },
  {
    email: 'buyer2@gmail.com',
    password: '369852abc!',
    company_name: 'Gastro Gut Essen',
    address: 'Ludwigstrasse 11, Hamburg',
    country: 'Germany',
    user_type: 'food service',
    seller: false
 }
])

offers = Offer.create([
  {
    from_user: 4,
    date: Date.new(2020,3,3),
    start_date: Date.new(2020,7,1),
    end_date: Date.new(2020,6,30),
    remark: 'Please consult the general terms and conditions that apply to this offer request on our website.',
    status: 'requested'
  },
  {
    from_user: 1,
    to_user: 4,
    date: Date.new(2020,3,5),
    start_date: Date.new(2020,7,1),
    end_date: Date.new(2020,6,30),
    remark: 'Offer subject to unsold',
    offer_request_id: 1,
    follow_up_on_offer: 1,
    status: 'sent'
  },
  {
    from_user: 2,
    to_user: 4,
    date: Date.new(2020,3,6),
    start_date: Date.new(2020,7,1),
    end_date: Date.new(2020,6,30),
    remark: 'Offer subject to unsold',
    offer_request_id: 1,
    follow_up_on_offer: 1,
    status: 'sent'
  },
  {
    from_user: 4,
    to_user: 1,
    date: Date.new(2020,3,15),
    start_date: Date.new(2020,7,1),
    end_date: Date.new(2020,6,30),
    remark: 'Please consult the general terms and conditions that apply to this offer request on our website.',
    offer_request_id: 1,
    follow_up_on_offer: 2,
    status: 'sent'
  },
  {
    from_user: 1,
    to_user: 4,
    date: Date.new(2020,3,17),
    start_date: Date.new(2020,7,1),
    end_date: Date.new(2020,6,30),
    remark: 'Offer subject to unsold',
    offer_request_id: 1,
    follow_up_on_offer: 4,
    status: 'sent'
  },
  {
    from_user: 4,
    to_user: 1,
    date: Date.new(2020,3,20),
    start_date: Date.new(2020,7,1),
    end_date: Date.new(2020,6,30),
    remark: 'Please consult the general terms and conditions that apply to this offer request on our website.',
    offer_request_id: 1,
    follow_up_on_offer: 5,
    status: 'accepted'
  },
  {
    from_user: 1,
    to_user: 4,
    date: Date.new(2020,3,21),
    start_date: Date.new(2020,7,1),
    end_date: Date.new(2020,6,30),
    remark: 'Offer subject to unsold',
    offer_request_id: 1,
    follow_up_on_offer: 6,
    status: 'confirmed'
  },
  {
    from_user: 2,
    to_user: 3,
    date: Date.new(2020,3,9),
    start_date: Date.new(2020,4,1),
    end_date: Date.new(2020,4,30),
    remark: 'Offer subject to unsold',
    status: 'sent'
  }
])

offer_lines = OfferLine.create([
  {
    offer_id: 1,
    product_id: 1,
    quantity_in_tons: 100,
    target_offer_line_id: 1
  },
  {
    offer_id: 1,
    product_id: 2,
    quantity_in_tons: 60,
    target_offer_line_id: 2
  },
  {
    offer_id: 1,
    product_id: 3,
    quantity_in_tons: 25,
    target_offer_line_id: 3
  },
  {
    offer_id: 2,
    product_id: 4,
    quantity_in_tons: 100,
    target_offer_line_id: 1,
    alternative_to_target: false,
    price: 0.69
  },
  {
    offer_id: 2,
    product_id: 5,
    quantity_in_tons: 60,
    target_offer_line_id: 2,
    alternative_to_target: true,
    price: 0.55
  },
  {
    offer_id: 2,
    product_id: 6,
    quantity_in_tons: 25,
    target_offer_line_id: 3,
    alternative_to_target: false,
    price: 0.62
  },
  {
    offer_id: 3,
    product_id: 7,
    quantity_in_tons: 100,
    target_offer_line_id: 1,
    alternative_to_target: false,
    price: 0.78
  },
  {
    offer_id: 3,
    product_id: 8,
    quantity_in_tons: 60,
    target_offer_line_id: 2,
    alternative_to_target: false,
    price: 0.62
  },
  {
    offer_id: 3,
    product_id: 9,
    quantity_in_tons: 25,
    target_offer_line_id: 3,
    alternative_to_target: true,
    price: 0.5
  },
  {
    offer_id: 4,
    product_id: 4,
    quantity_in_tons: 100,
    target_offer_line_id: 1,
    alternative_to_target: false,
    price: 0.66
  },
  {
    offer_id: 4,
    product_id: 2,
    quantity_in_tons: 60,
    target_offer_line_id: 2,
    alternative_to_target: false,
    price: 0.5
  },
  {
    offer_id: 4,
    product_id: 6,
    quantity_in_tons: 25,
    target_offer_line_id: 3,
    alternative_to_target: false,
    price: 0.6
  },
  {
    offer_id: 5,
    product_id: 4,
    quantity_in_tons: 100,
    target_offer_line_id: 1,
    alternative_to_target: false,
    price:
  },
  {
    offer_id: 5,
    product_id: ,
    quantity_in_tons: ,
    target_offer_line_id: 2,
    alternative_to_target: ,
    price:
  },
  {
    offer_id: 5,
    product_id: ,
    quantity_in_tons: ,
    target_offer_line_id: 2,
    alternative_to_target: true,
    price:
  },
  {
    offer_id: 5,
    product_id: ,
    quantity_in_tons: ,
    target_offer_line_id: 3,
    alternative_to_target: ,
    price:
  },
  {
    offer_id: ,
    product_id: ,
    quantity_in_tons: ,
    target_offer_line_id: ,
    alternative_to_target: ,
    price:
  },
  {
    offer_id: ,
    product_id: ,
    quantity_in_tons: ,
    target_offer_line_id: ,
    alternative_to_target: ,
    price:
  },
  {
    offer_id: ,
    product_id: ,
    quantity_in_tons: ,
    target_offer_line_id: ,
    alternative_to_target: ,
    price:
  },
  {
    offer_id: ,
    product_id: ,
    quantity_in_tons: ,
    target_offer_line_id: ,
    alternative_to_target: ,
    price:
  },
  {
    offer_id: ,
    product_id: ,
    quantity_in_tons: ,
    target_offer_line_id: ,
    alternative_to_target: ,
    price:
  },
  {
    offer_id: ,
    product_id: ,
    quantity_in_tons: ,
    target_offer_line_id: ,
    alternative_to_target: ,
    price:
  },
  {
    offer_id: ,
    product_id: ,
    quantity_in_tons: ,
    target_offer_line_id: ,
    alternative_to_target: ,
    price:
  },
  {
    offer_id: ,
    product_id: ,
    quantity_in_tons: ,
    target_offer_line_id: ,
    alternative_to_target: ,
    price:
  },
  {
    offer_id: ,
    product_id: ,
    quantity_in_tons: ,
    target_offer_line_id: ,
    alternative_to_target: ,
    price:
  },
  {
    offer_id: ,
    product_id: ,
    quantity_in_tons: ,
    target_offer_line_id: ,
    alternative_to_target: ,
    price:
  },
  {
    offer_id: ,
    product_id: ,
    quantity_in_tons: ,
    target_offer_line_id: ,
    alternative_to_target: ,
    price:
  },
  {
    offer_id: ,
    product_id: ,
    quantity_in_tons: ,
    target_offer_line_id: ,
    alternative_to_target: ,
    price:
  },
  {
    offer_id: ,
    product_id: ,
    quantity_in_tons: ,
    target_offer_line_id: ,
    alternative_to_target: ,
    price:
  },
  {
    offer_id: ,
    product_id: ,
    quantity_in_tons: ,
    target_offer_line_id: ,
    alternative_to_target: ,
    price:
  },
  {
    offer_id: ,
    product_id: ,
    quantity_in_tons: ,
    target_offer_line_id: ,
    alternative_to_target: ,
    price:
  },
])

Product.destroy_all
ProdCategory.destroy_all
Certificate.destroy_all
CompCert.destroy_all
ProdCert.destroy_all
