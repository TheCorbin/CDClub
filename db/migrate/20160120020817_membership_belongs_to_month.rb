class MembershipBelongsToMonth < ActiveRecord::Migration
  def change
    add_column :memberships, :month_id, :integer, index: true, foreign_key: true
    remove_column :memberships, :month, :string
  end
end
