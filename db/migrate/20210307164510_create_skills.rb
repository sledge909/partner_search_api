class CreateSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :skills do |t|
      t.references :service, null: false, foreign_key: true
      t.references :partner, null: false, foreign_key: true
      t.boolean :wood, null: false, default: false
      t.boolean :carpet, null: false, default: false
      t.boolean :tile, null: false, default: false

      t.timestamps
    end
  end
end
