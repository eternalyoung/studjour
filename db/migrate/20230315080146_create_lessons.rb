class CreateLessons < ActiveRecord::Migration[7.0]
  def change
    create_table :lessons do |t|
      t.integer :number, null: false
      t.boolean :adjacent, null: false, default: false
      t.references :schedule, null: false, foreign_key: true
      t.references :subject, null: false, foreign_key: true
      t.references :teacher, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true
      t.boolean :got_changes, null: false, default: false

      t.timestamps
    end
  end
end
