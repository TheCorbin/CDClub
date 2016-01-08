class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.string :month
      t.string :email
      t.text :address

      t.timestamps null: false
    end
  end
end
