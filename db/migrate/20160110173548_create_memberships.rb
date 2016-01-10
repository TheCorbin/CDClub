class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.references :member, index: true, foreign_key: true
      t.references :season, index: true, foreign_key: true
      t.string :month

      t.timestamps null: false
    end
  end
end
