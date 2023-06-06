class CreateLessonsChanges < ActiveRecord::Migration[7.0]
  def change
    create_table :lessons_changes do |t|
      t.integer :number, null: false
      t.references :subject, null: false, foreign_key: true
      t.references :teacher, null: false, foreign_key: true
      t.integer :room, null: false

      t.timestamps
    end
  end
end
