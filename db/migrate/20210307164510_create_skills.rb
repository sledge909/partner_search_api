class CreateSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :skills do |t|
      t.references :service, null: false, foreign_key: true
      t.string :name, null: false

      t.timestamps
    end
  end
end
