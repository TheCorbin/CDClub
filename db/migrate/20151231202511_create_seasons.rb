class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
      t.string :name
      t.date :beginning_date
      t.date :ending_date

      t.timestamps null: false
    end
  end
end
