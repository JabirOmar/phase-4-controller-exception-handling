class CreateBirds < ActiveRecord::Migration[6.1]
  def change
    create_table :birds do |t|
      t.string :name, null: false
      t.string :species, null: false

      t.timestamps
    end
  end
end
