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

ActiveRecord::Schema.define(version: 2018_07_13_162424) do

  create_table "controlenhancements", force: :cascade do |t|
    t.integer "nistcontrol_id"
    t.string "number"
    t.string "title"
    t.string "baselineimpact"
    t.text "baseControlEnhancementDescription"
    t.text "withdrawn"
    t.text "SGdesc"
    t.string "SGrelated"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "controlenhancementstatements", force: :cascade do |t|
    t.integer "controlenhancement_id"
    t.string "number"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "controlenhancementsubstatements", force: :cascade do |t|
    t.integer "controlenhancementstatement_id"
    t.string "number"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "controls", force: :cascade do |t|
    t.text "title"
    t.text "description"
    t.text "publisher"
    t.text "path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "iacontrols", force: :cascade do |t|
    t.string "nistcontrolnumber"
    t.string "controlSubjectArea"
    t.string "impact"
    t.string "name"
    t.text "description"
    t.string "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mappings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nistcontrols", force: :cascade do |t|
    t.text "family"
    t.text "number"
    t.text "title"
    t.text "priority"
    t.text "basestatement"
    t.text "withdrawn"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "impact"
    t.text "SGdescription"
    t.text "SGrelated"
  end

  create_table "statements", force: :cascade do |t|
    t.integer "nistcontrol_id"
    t.string "number"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "substatements", force: :cascade do |t|
    t.integer "statement_id"
    t.string "number"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
