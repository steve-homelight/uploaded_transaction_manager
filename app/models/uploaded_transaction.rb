class UploadedTransaction < ApplicationRecord
  require 'csv'
  paginates_per 10

  belongs_to :listing_agent, required: false, class_name: "Agent"
  belongs_to :selling_agent, required: false, class_name: "Agent"

  scope :single_family_homes, -> { where(property_type: "single_family_home") }
  scope :sold, -> { where(status: "sold") }

  validates :address, :zip, :selling_date, presence: true
  validates_uniqueness_of :address, scope: [:zip, :selling_date],
    message: "with this property, zip, and selling date already exists."

  def full_address
    "#{address}, #{city}, #{state} #{zip}"
  end

  def self.import_from_csv(file)
    successes = 0, 0
    CSV.foreach(file.path, headers: true) do |row|
      row = row.to_hash
      transaction = find_or_initialize_by(
        address: row["address"],
        zip: row["zip"],
        selling_date: row["selling_date"]
      )
      create(row) if transaction.new_record?
    end
  end
end
