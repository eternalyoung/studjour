class CreateWeekStatuses < ActiveRecord::Migration[7.0]
  def change
    create_table :week_statuses do |t|
      t.boolean :even_week, default: true

      t.timestamps
    end
  end
end
