class CreateSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :schedules do |t|
      t.string :group
      t.integer :weeks_day

      t.timestamps
    end
  end
end
