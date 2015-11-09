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

ActiveRecord::Schema.define(version: 20151109102824) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "competences", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "max_count",  default: 0
  end

  create_table "courses", force: :cascade do |t|
    t.string   "code"
    t.integer  "points"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "courses", ["code"], name: "index_courses_on_code", unique: true, using: :btree

  create_table "data_categories", force: :cascade do |t|
    t.string   "slug"
    t.integer  "priority"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "data_entries", force: :cascade do |t|
    t.string   "url"
    t.string   "heading"
    t.text     "summary"
    t.integer  "priority"
    t.integer  "data_category_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "image_path"
  end

  add_index "data_entries", ["data_category_id"], name: "index_data_entries_on_data_category_id", using: :btree

  create_table "humen", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "uuid"
    t.integer  "team_id"
    t.integer  "study_year"
    t.integer  "course_id"
    t.integer  "competence_id"
    t.boolean  "signed_up",               default: false
    t.boolean  "welcome_email_sent",      default: false
    t.boolean  "email_confirmed",         default: false
    t.text     "email_confirmation_hash"
    t.datetime "confirm_email_expire_at"
    t.string   "locale"
  end

  add_index "humen", ["competence_id"], name: "index_humen_on_competence_id", using: :btree
  add_index "humen", ["course_id"], name: "index_humen_on_course_id", using: :btree
  add_index "humen", ["signed_up"], name: "index_humen_on_signed_up", using: :btree
  add_index "humen", ["team_id"], name: "index_humen_on_team_id", using: :btree
  add_index "humen", ["uuid"], name: "index_humen_on_uuid", using: :btree

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "overview_api_key"
  end

  create_table "waitlists", force: :cascade do |t|
    t.integer  "human_id"
    t.datetime "spot_offered"
    t.integer  "team_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "waitlists", ["human_id"], name: "index_waitlists_on_human_id", using: :btree
  add_index "waitlists", ["team_id"], name: "index_waitlists_on_team_id", using: :btree

  add_foreign_key "data_entries", "data_categories"
  add_foreign_key "humen", "competences"
  add_foreign_key "humen", "courses"
  add_foreign_key "humen", "teams"
  add_foreign_key "waitlists", "humen"
  add_foreign_key "waitlists", "teams"
end
