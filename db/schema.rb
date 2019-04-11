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

ActiveRecord::Schema.define(version: 2019_04_11_182501) do

  create_table "cat_owners", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "cat_id"
    t.bigint "owner_id"
    t.integer "cat_status"
    t.integer "owner_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cat_id"], name: "index_cat_owners_on_cat_id"
    t.index ["owner_id"], name: "index_cat_owners_on_owner_id"
  end

  create_table "cats", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.boolean "fluff_ears"
    t.string "meow"
    t.string "personality"
    t.boolean "claws"
    t.integer "fluff_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fluff_type"], name: "index_cats_on_fluff_type"
  end

  create_table "owners", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.boolean "actually_a_catgirl"
    t.integer "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["actually_a_catgirl"], name: "index_owners_on_actually_a_catgirl"
    t.index ["location"], name: "index_owners_on_location"
  end

end
