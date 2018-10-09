class CreateUploadedTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :uploaded_transactions do |t|
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.date :listing_date
      t.integer :listing_price
      t.references :listing_agent, foreign_key: true, class_name: :Agent
      t.date :selling_date
      t.integer :selling_price
      t.references :selling_agent, foreign_key: true, class_name: :Agent
      t.string :status
      t.string :property_type

      t.timestamps
    end
  end
end
