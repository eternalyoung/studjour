class AddTagToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :tag, :string, index: {unique: true}
  end
end
