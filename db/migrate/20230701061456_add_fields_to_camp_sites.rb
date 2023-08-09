class AddFieldsToCampSites < ActiveRecord::Migration[5.2]
  def change
    add_column :camp_sites, :name, :string
    add_column :camp_sites, :post_code, :string
    add_column :camp_sites, :address, :string
    add_column :camp_sites, :phone_number, :string
  end
end
