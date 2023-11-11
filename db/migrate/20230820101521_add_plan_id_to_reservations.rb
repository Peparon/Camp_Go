class AddPlanIdToReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :plan_id, :integer
  end
end
