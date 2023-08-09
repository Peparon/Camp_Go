class AddAboutToCampSites < ActiveRecord::Migration[5.2]
  def change
    add_column :camp_sites, :about, :text
  end
end
