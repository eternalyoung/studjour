class CreateTeachers < ActiveRecord::Migration[7.0]
  def change
    create_table :teachers do |t|
      t.string :name, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
