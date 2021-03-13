class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.references :partner, null: false, foreign_key: true
      t.string :name, null: false

      t.timestamps
    end
  end
end
