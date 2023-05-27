# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_03_15_080607) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lessons", force: :cascade do |t|
    t.integer "number", null: false
    t.boolean "adjacent", default: false, null: false
    t.bigint "schedule_id", null: false
    t.bigint "subject_id", null: false
    t.bigint "teacher_id", null: false
    t.bigint "room_id", null: false
    t.boolean "got_changes", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_lessons_on_room_id"
    t.index ["schedule_id"], name: "index_lessons_on_schedule_id"
    t.index ["subject_id"], name: "index_lessons_on_subject_id"
    t.index ["teacher_id"], name: "index_lessons_on_teacher_id"
  end

  create_table "lessons_changes", force: :cascade do |t|
    t.bigint "lesson_id", null: false
    t.bigint "subject_id", null: false
    t.bigint "teacher_id", null: false
    t.bigint "room_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_lessons_changes_on_lesson_id"
    t.index ["room_id"], name: "index_lessons_changes_on_room_id"
    t.index ["subject_id"], name: "index_lessons_changes_on_subject_id"
    t.index ["teacher_id"], name: "index_lessons_changes_on_teacher_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.integer "number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["number"], name: "index_rooms_on_number", unique: true
  end

  create_table "schedules", force: :cascade do |t|
    t.bigint "group_id", null: false
    t.integer "weeks_day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_schedules_on_group_id", unique: true
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_subjects_on_name", unique: true
  end

  create_table "teachers", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_teachers_on_name", unique: true
  end

  add_foreign_key "lessons", "rooms"
  add_foreign_key "lessons", "schedules"
  add_foreign_key "lessons", "subjects"
  add_foreign_key "lessons", "teachers"
  add_foreign_key "lessons_changes", "lessons"
  add_foreign_key "lessons_changes", "rooms"
  add_foreign_key "lessons_changes", "subjects"
  add_foreign_key "lessons_changes", "teachers"
  add_foreign_key "schedules", "groups"
end
