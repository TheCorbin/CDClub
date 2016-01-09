class RemoveMonthFromMembers < ActiveRecord::Migration
  def change
    remove_column :members, :month, :string
  end
end
