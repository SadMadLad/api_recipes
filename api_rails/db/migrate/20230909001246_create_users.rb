# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :age
      t.date :dob
      t.string :nationality
      t.string :programming_language, default: 'ruby/rails'
    end
  end
end
