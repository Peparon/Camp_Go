class CreatePlans < ActiveRecord::Migration[5.2]
  def change
    create_table :plans do |t|
      t.string :name
      t.integer :price
      t.integer :capacity
      t.text :about
      t.references :camp_site, foreign_key: true

      t.timestamps
    end
  end
end
