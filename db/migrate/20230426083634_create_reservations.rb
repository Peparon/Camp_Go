class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.bigint :user_id
      t.bigint :plan_id
      t.date :start_date
      t.date :end_date
      t.bigint :guests

      t.timestamps
    end
    
    add_foreign_key :reservations, :users
    add_foreign_key :reservations, :plans
  end
end
