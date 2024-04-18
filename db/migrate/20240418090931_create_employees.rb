# frozen_string_literal: true

# This migration creates the employees table with the necessary fields.
class CreateEmployees < ActiveRecord::Migration[7.1]
  # rubocop:disable Metrics/MethodLength
  def change
    create_table :employees, id: :uuid do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.date :date_of_birth
      t.text :address
      t.string :country
      t.text :bio
      t.decimal :rating

      t.timestamps
    end
    # rubocop:enable Metrics/MethodLength
  end
end
