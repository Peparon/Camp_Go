class CreatePlans < ActiveRecord::Migration[5.2]
  def change
    create_table :plans do |t|
      t.string :name
      t.integer :price
      t.integer :capacity
      t.text :about
      t.bigint :camp_site_id

      t.timestamps
    end
    
    add_foreign_key :plans, :camp_sites
  end
end
