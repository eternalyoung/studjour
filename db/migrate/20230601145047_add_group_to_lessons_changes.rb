class AddGroupToLessonsChanges < ActiveRecord::Migration[7.0]
  def change
    add_reference :lessons_changes, :group, null: false, foreign_key: true
  end
end
