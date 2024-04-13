class CreatePets < ActiveRecord::Migration[7.1]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :breed
      t.text :description
      t.string :url
      t.boolean :adopt, default: false

      t.timestamps
    end
  end
end
