class CreatePartnerSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :partner_skills do |t|
      t.belongs_to :partner
      t.belongs_to :skill

      t.timestamps
    end
  end
end
