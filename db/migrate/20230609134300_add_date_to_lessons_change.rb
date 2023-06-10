class AddDateToLessonsChange < ActiveRecord::Migration[7.0]
  def change
    add_column :lessons_changes, :date, :date, null: false
  end
end
