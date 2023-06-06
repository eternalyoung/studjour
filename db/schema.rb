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

ActiveRecord::Schema[7.0].define(version: 2023_06_01_145047) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "citext"
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
    t.integer "room", null: false
    t.boolean "got_changes", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["schedule_id"], name: "index_lessons_on_schedule_id"
    t.index ["subject_id"], name: "index_lessons_on_subject_id"
    t.index ["teacher_id"], name: "index_lessons_on_teacher_id"
  end

  create_table "lessons_changes", force: :cascade do |t|
    t.integer "number", null: false
    t.bigint "subject_id", null: false
    t.bigint "teacher_id", null: false
    t.integer "room", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "group_id", null: false
    t.index ["group_id"], name: "index_lessons_changes_on_group_id"
    t.index ["subject_id"], name: "index_lessons_changes_on_subject_id"
    t.index ["teacher_id"], name: "index_lessons_changes_on_teacher_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_roles_on_name", unique: true
  end

  create_table "schedules", force: :cascade do |t|
    t.bigint "group_id", null: false
    t.integer "weeks_day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_schedules_on_group_id"
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

  create_table "user_login_change_keys", force: :cascade do |t|
    t.string "key", null: false
    t.string "login", null: false
    t.datetime "deadline", null: false
  end

  create_table "user_password_reset_keys", force: :cascade do |t|
    t.string "key", null: false
    t.datetime "deadline", null: false
    t.datetime "email_last_sent", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "user_remember_keys", force: :cascade do |t|
    t.string "key", null: false
    t.datetime "deadline", null: false
  end

  create_table "user_roles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "role_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_user_roles_on_role_id"
    t.index ["user_id"], name: "index_user_roles_on_user_id"
  end

  create_table "user_verification_keys", force: :cascade do |t|
    t.string "key", null: false
    t.datetime "requested_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "email_last_sent", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer "status", default: 1, null: false
    t.citext "email", null: false
    t.string "password_hash"
    t.string "tag"
    t.boolean "sub_to_schedule", default: false
    t.boolean "sub_to_changes", default: false
    t.boolean "sub_to_all_events", default: false
    t.bigint "group_id"
    t.index ["email"], name: "index_users_on_email", unique: true, where: "(status = ANY (ARRAY[1, 2]))"
    t.index ["group_id"], name: "index_users_on_group_id"
  end

  add_foreign_key "lessons", "schedules"
  add_foreign_key "lessons", "subjects"
  add_foreign_key "lessons", "teachers"
  add_foreign_key "lessons_changes", "groups"
  add_foreign_key "lessons_changes", "subjects"
  add_foreign_key "lessons_changes", "teachers"
  add_foreign_key "schedules", "groups"
  add_foreign_key "user_login_change_keys", "users", column: "id"
  add_foreign_key "user_password_reset_keys", "users", column: "id"
  add_foreign_key "user_remember_keys", "users", column: "id"
  add_foreign_key "user_roles", "roles"
  add_foreign_key "user_roles", "users"
  add_foreign_key "user_verification_keys", "users", column: "id"
  add_foreign_key "users", "groups"
end
