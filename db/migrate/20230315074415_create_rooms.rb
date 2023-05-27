class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.integer :number, null: false, index: {unique: true}

      t.timestamps
    end
  end
end
