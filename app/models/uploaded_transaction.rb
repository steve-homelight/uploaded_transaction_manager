class UploadedTransaction < ApplicationRecord
  require 'csv'

  belongs_to :listing_agent, required: false, class_name: "Agent"
  belongs_to :selling_agent, required: false, class_name: "Agent"

  scope :single_family_homes, -> { where(property_type: "single_family_home") }
  scope :sold, -> { where(status: "sold") }

  def full_address
    "#{address}, #{city}, #{state} #{zip}"
  end

  def self.import_from_csv(file)
    successes, failures = 0, 0
    CSV.foreach(file.path, headers: true) do |row|
      puts row.to_hash
    end
  end
end
