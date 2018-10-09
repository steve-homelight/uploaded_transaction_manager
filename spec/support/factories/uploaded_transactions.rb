require "date"

FactoryGirl.define do
  property_types = %w(condo single_family_home multi_family_home commercial mobile_home land)
  statuses = %w(sold pending closed cancelled expired active)

  listing_date = Date.today - rand(180..900)
  selling_date = listing_date + rand(14..90)

  factory :uploaded_transaction do
    address { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Address.state }
    zip { Faker::Address.zip }
    listing_date { listing_date }
    listing_price { rand(100_000..1_000_000) }
    selling_date { selling_date }
    selling_price { rand(100_000..1_000_000) }
    status { statuses.sample }
    property_type { property_types.sample }

    trait :random_agent_assoication do
      listing_agent { listing_agent }
      selling_agent { selling_agent }
    end
  end

  def listing_agent
    rand(0..3) == 3 ? nil : agent
  end

  def selling_agent
    rand(0..3) == 3 ? nil : agent
  end
end
