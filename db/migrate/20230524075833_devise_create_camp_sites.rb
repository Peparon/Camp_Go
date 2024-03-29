# frozen_string_literal: true

class DeviseCreateCampSites < ActiveRecord::Migration[5.2]
  def change
    create_table :camp_sites do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      t.string :name
      t.string :post_code
      t.string :address
      t.string :phone_number
      t.boolean :is_deleted, default: false, null: false

      t.timestamps null: false
    end

    add_index :camp_sites, :email,                unique: true
    add_index :camp_sites, :reset_password_token, unique: true
    # add_index :camp_sites, :confirmation_token,   unique: true
    # add_index :camp_sites, :unlock_token,         unique: true
  end
end
