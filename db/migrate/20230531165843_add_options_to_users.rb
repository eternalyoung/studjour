class AddOptionsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :sub_to_schedule, :boolean, default: false
    add_column :users, :sub_to_changes, :boolean, default: false
    add_column :users, :sub_to_all_events, :boolean, default: false
  end
end
