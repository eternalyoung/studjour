class CreateLessonsChanges < ActiveRecord::Migration[7.0]
  def change
    create_table :lessons_changes do |t|
      t.references :lesson, null: false, foreign_key: true
      t.references :subject, null: false, foreign_key: true
      t.references :teacher, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true

      t.timestamps
    end
  end
end
