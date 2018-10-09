require "faker"

property_types = %w(condo single_family_home multi_family_home commercial mobile_home land)
statuses = %w(sold pending closed cancelled expired active)

10.times do |_i|
  Agent.create(first_name: Faker::Name.first_name,
               last_name: Faker::Name.last_name,
               bio: Faker::HitchhikersGuideToTheGalaxy.quote)
end

1_000.times do |_i|
  listing_date = Date.today - rand(180..900).days
  selling_date = listing_date + rand(14..90).days
  listing_agent = rand(0..3) == 3 ? nil : Agent.all.sample
  selling_agent = rand(0..3) == 3 ? nil : Agent.all.sample

  UploadedTransaction.create(address: Faker::Address.street_address,
                             city: Faker::Address.city,
                             state: Faker::Address.state,
                             zip: Faker::Address.zip,
                             listing_date: listing_date,
                             listing_price: rand(100_000..1_000_000),
                             listing_agent: listing_agent,
                             selling_date: selling_date,
                             selling_price: rand(100_000..1_000_000),
                             selling_agent: selling_agent,
                             status: statuses.sample,
                             property_type: property_types.sample)
end
