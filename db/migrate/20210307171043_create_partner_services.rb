class CreatePartnerServices < ActiveRecord::Migration[6.0]
  def change
    create_table :partner_services do |t|
      t.belongs_to :partner
      t.belongs_to :service

      t.timestamps
    end
  end
end
