# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171113133254) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string   "description"
    t.string   "image"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "grades", force: :cascade do |t|
    t.float    "computer1"
    t.float    "computer2"
    t.float    "computer3"
    t.float    "computer4"
    t.float    "english1"
    t.float    "english2"
    t.float    "english3"
    t.float    "english4"
    t.float    "epp1"
    t.float    "epp2"
    t.float    "epp3"
    t.float    "epp4"
    t.float    "filipino1"
    t.float    "filipino2"
    t.float    "filipino3"
    t.float    "filipino4"
    t.float    "mapeh1"
    t.float    "mapeh2"
    t.float    "mapeh3"
    t.float    "mapeh4"
    t.float    "mathematics1"
    t.float    "mathematics2"
    t.float    "mathematics3"
    t.float    "mathematics4"
    t.float    "mother_tongue1"
    t.float    "mother_tongue2"
    t.float    "mother_tongue3"
    t.float    "mother_tongue4"
    t.float    "science1"
    t.float    "science2"
    t.float    "science3"
    t.float    "science4"
    t.float    "sibika1"
    t.float    "sibika2"
    t.float    "sibika3"
    t.float    "sibika4"
    t.float    "tle1"
    t.float    "tle2"
    t.float    "tle3"
    t.float    "tle4"
    t.string   "school_year"
    t.integer  "student_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "grades", ["student_id"], name: "index_grades_on_student_id", using: :btree

  create_table "payments", force: :cascade do |t|
    t.string   "or_number"
    t.float    "amount"
    t.string   "school_year"
    t.date     "payment_date"
    t.string   "description"
    t.integer  "student_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "payments", ["student_id"], name: "index_payments_on_student_id", using: :btree

  create_table "positions", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.integer  "year_level_id"
    t.integer  "section_id"
    t.string   "school_year"
    t.string   "description"
    t.string   "schedule_day"
    t.string   "schedule_time"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "schedules", ["section_id"], name: "index_schedules_on_section_id", using: :btree
  add_index "schedules", ["year_level_id"], name: "index_schedules_on_year_level_id", using: :btree

  create_table "sections", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "student_year_sections", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "year_level_id"
    t.integer  "section_id"
    t.string   "school_year"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "student_year_sections", ["section_id"], name: "index_student_year_sections_on_section_id", using: :btree
  add_index "student_year_sections", ["student_id"], name: "index_student_year_sections_on_student_id", using: :btree
  add_index "student_year_sections", ["year_level_id"], name: "index_student_year_sections_on_year_level_id", using: :btree

  create_table "students", force: :cascade do |t|
    t.string   "fname"
    t.string   "mname"
    t.string   "lname"
    t.date     "birthdate"
    t.string   "birthplace"
    t.string   "gender"
    t.string   "address"
    t.string   "status"
    t.string   "student_id"
    t.integer  "user_id"
    t.string   "religion"
    t.string   "father_name"
    t.string   "father_address"
    t.string   "father_contact"
    t.date     "father_birthdate"
    t.string   "father_occupation"
    t.string   "mother_name"
    t.string   "mother_address"
    t.string   "mother_contact"
    t.date     "mother_birthdate"
    t.string   "mother_occupation"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "teachers", force: :cascade do |t|
    t.string   "teacherid"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "position_id"
    t.integer  "subject_id"
    t.integer  "room_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "teachers", ["position_id"], name: "index_teachers_on_position_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "user_name"
    t.string   "user_pass"
    t.string   "status"
    t.integer  "access"
    t.integer  "tries"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "year_levels", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_foreign_key "grades", "students"
  add_foreign_key "payments", "students"
  add_foreign_key "schedules", "sections"
  add_foreign_key "schedules", "year_levels"
  add_foreign_key "student_year_sections", "sections"
  add_foreign_key "student_year_sections", "students"
  add_foreign_key "student_year_sections", "year_levels"
  add_foreign_key "teachers", "positions"
end
