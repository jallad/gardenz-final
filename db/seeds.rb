# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Experience.destroy_all
UserAddress.destroy_all
OfferDetail.destroy_all
Skill.destroy_all
Offer.destroy_all
Request.destroy_all

User.destroy_all

User.create! [
               { first_name: 'Ahmad', last_name: 'Jallad', email: 'jallada@mcmaster.ca', password: '123'},
               { first_name: 'James', last_name: 'Theodore', email: 'james@yahoo.com', password: '123'},
               { first_name: 'Eduardo', last_name: 'Werneck', email: 'eduardo@google.com', password: '123'},
               { first_name: 'Junia', last_name: 'Joseph', email: 'junia@hotmail.com', password: '123'},
               { first_name: 'Hilary', last_name: 'Thombson', email: 'hilary@gmail.com', password: '123'}
             ]

UserAddress.create! [
                      {street: '105 Allan St', city: 'Oakville', country: 'Canada', user_id: User.first.id },
                      {street: '105 Allan St', city: 'Oakville', country: 'Canada', user_id: User.last.id }
                    ]
Experience.create! [
                     {project_name: "Ontario Garden", from: "2020-04-17", to: "2020-06-15", description: "Ontario Garden Project", user_id: User.first.id}
                   ]

Request.create! [
                  { subject: 'Potato Project' , description: 'Planting 10,000 m white potatoes.' } ,
                  { subject: 'Tomatoes', description: 'Roma Tomato request' },
                  { subject: 'Cucumbers', description: '100 Tons cucumbers request' },
                  { subject: 'Bananas', description: 'Banana import request' },
                  { subject: 'Herbs', description: 'Edible herbs two months request' },
                  { subject: 'Apples', description: 'American apples request' }
                ]

User.first.offers.create! [
                            { value: 1000.50, request_id: Request.first.id},
                            { value: 5000, request_id: Request.second.id}
                          ]
OfferDetail.create! [ {days: 45, description: "45 man days technical proposal", offer_id: Offer.first.id}]
OfferDetail.create! [ {days: 50, description: "50 man days technical proposal", offer_id: Offer.second.id}]

User.last.offers.create! [
                            { value: 4900, request_id: Request.first.id},
                            { value: 2350, request_id: Request.second.id}
                          ]
OfferDetail.create! [ {days: 40, description: "40 man days technical proposal", offer_id: Offer.third.id}]
OfferDetail.create! [ {days: 60, description: "60 man days technical proposal", offer_id: Offer.last.id}]


Skill.create! [
                { name: 'Vegetables' },
                { name: 'Herbs'},
                { name: 'Mowing Lawn' },
                { name: 'Trees trimming'},
                { name: 'Irrigation systems'}
              ]

User.first.skills << Skill.first
User.last.skills << Skill.last

