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

ActiveRecord::Schema.define(version: 20171120000802) do

  create_table "comments", force: :cascade do |t|
    t.string "user", null: false
    t.string "comment", null: false
    t.string "issue_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "issue_lists", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "issues", force: :cascade do |t|
    t.string "title", null: false
    t.string "kind", null: false
    t.string "priority", null: false
    t.string "status", null: false
    t.integer "votes", null: false
    t.string "assignee"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "issue_list_id"
    t.index ["issue_list_id"], name: "index_issues_on_issue_list_id"
  end

  create_table "issues_votes", force: :cascade do |t|
    t.string "username", null: false
    t.integer "issue_id", null: false
    t.index ["username", "issue_id"], name: "index_issues_votes_on_username_and_issue_id", unique: true
  end

  create_table "issues_watches", force: :cascade do |t|
    t.string "username", null: false
    t.integer "issue_id", null: false
    t.index ["username", "issue_id"], name: "index_issues_watches_on_username_and_issue_id", unique: true
  end

  create_table "users", primary_key: "username", id: :string, force: :cascade do |t|
    t.string "full_name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_url"
    t.index ["username"], name: "index_users_on_username"
    t.index ["username"], name: "sqlite_autoindex_users_1", unique: true
  end

end
