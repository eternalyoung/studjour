class CreateSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :schedules do |t|
      t.references :group, null: false, foreign_key: true
      t.integer :weeks_day

      t.timestamps
    end
  end
end
