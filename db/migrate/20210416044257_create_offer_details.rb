class CreateOfferDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :offer_details do |t|
      t.integer :days
      t.string :description
      t.references :offer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
