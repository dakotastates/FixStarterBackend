# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_23_212843) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "problem_categories", force: :cascade do |t|
    t.bigint "problem_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_problem_categories_on_category_id"
    t.index ["problem_id"], name: "index_problem_categories_on_problem_id"
  end

  create_table "problems", force: :cascade do |t|
    t.string "problemTitle"
    t.string "description"
    t.string "longitude"
    t.string "latitude"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_problems_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.bigint "proposal_id", null: false
    t.boolean "active", default: true
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["proposal_id"], name: "index_projects_on_proposal_id"
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "proposal_resources", force: :cascade do |t|
    t.bigint "resource_id", null: false
    t.bigint "proposal_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["proposal_id"], name: "index_proposal_resources_on_proposal_id"
    t.index ["resource_id"], name: "index_proposal_resources_on_resource_id"
  end

  create_table "proposals", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.bigint "problem_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["problem_id"], name: "index_proposals_on_problem_id"
    t.index ["user_id"], name: "index_proposals_on_user_id"
  end

  create_table "resources", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "firstName"
    t.string "lastName"
    t.string "bio"
    t.string "avatar"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "problem_categories", "categories"
  add_foreign_key "problem_categories", "problems"
  add_foreign_key "problems", "users"
  add_foreign_key "projects", "proposals"
  add_foreign_key "projects", "users"
  add_foreign_key "proposal_resources", "proposals"
  add_foreign_key "proposal_resources", "resources"
  add_foreign_key "proposals", "problems"
  add_foreign_key "proposals", "users"
end
