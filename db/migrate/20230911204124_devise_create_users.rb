# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: "", index: true, unique: true
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token, index: true, unique: true
      t.datetime :reset_password_sent_at
      t.string   :name

      ## Rememberable
      t.datetime :remember_created_at

      t.timestamps null: false
    end

    # add_index :users, :email,                unique: true
    # add_index :users, :reset_password_token, unique: true
  end
end
