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

ActiveRecord::Schema.define(version: 20170925175736) do

  create_table "developers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "project_id"
  end

  create_table "developers_projects", id: false, force: :cascade do |t|
    t.integer "developer_id"
    t.integer "project_id"
    t.index ["developer_id"], name: "index_developers_projects_on_developer_id"
    t.index ["project_id"], name: "index_developers_projects_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "time_entries", force: :cascade do |t|
    t.float "entry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "developer_id"
    t.date "date_field"
    t.integer "project_id"
  end

end
