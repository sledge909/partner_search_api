class CreatePartners < ActiveRecord::Migration[6.0]
  def change
    create_table :partners do |t|
      t.boolean :flooring, null: false, default: false
      t.string :address, null: false
      t.integer :operating_radius, null: false
      t.integer :rating, null: false

      t.timestamps
    end
  end
end
