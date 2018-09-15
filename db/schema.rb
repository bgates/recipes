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

ActiveRecord::Schema.define(version: 2018_09_15_013411) do

  create_table "ingredient_amounts", force: :cascade do |t|
    t.float "unit_number"
    t.string "unit_name"
    t.integer "ingredient_id"
    t.integer "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ingredient_id"], name: "index_ingredient_amounts_on_ingredient_id"
    t.index ["recipe_id"], name: "index_ingredient_amounts_on_recipe_id"
  end

  create_table "ingredient_line_items", force: :cascade do |t|
    t.integer "ingredient_id"
    t.integer "meal_id"
    t.string "unit_name"
    t.float "unit_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ingredient_id"], name: "index_ingredient_line_items_on_ingredient_id"
    t.index ["meal_id"], name: "index_ingredient_line_items_on_meal_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.float "fat"
    t.float "carb"
    t.float "protein"
    t.float "calories"
    t.float "unit_number"
    t.string "unit_name"
    t.float "cost"
    t.string "ndbno"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "fiber"
    t.float "sugar"
    t.float "calcium"
    t.float "iron"
    t.float "magnesium"
    t.float "phosphorus"
    t.float "potassium"
    t.float "sodium"
    t.float "zinc"
    t.float "vitamin_c"
    t.float "thiamin"
    t.float "riboflavin"
    t.float "niacin"
    t.float "vitamin_b6"
    t.float "folate"
    t.float "vitamin_b12"
    t.float "vitamin_a"
    t.float "vitamin_e"
    t.float "vitamin_d"
    t.float "vitamin_k"
    t.float "saturated_fat"
    t.float "monounsaturated_fat"
    t.float "polyunsaturated_fat"
    t.float "trans_fat"
    t.float "cholesterol"
    t.integer "size_conversion_id"
    t.index ["size_conversion_id"], name: "index_ingredients_on_size_conversion_id"
  end

  create_table "meals", force: :cascade do |t|
    t.date "date"
    t.string "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipe_line_items", force: :cascade do |t|
    t.integer "recipe_id"
    t.integer "meal_id"
    t.float "servings"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meal_id"], name: "index_recipe_line_items_on_meal_id"
    t.index ["recipe_id"], name: "index_recipe_line_items_on_recipe_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name"
    t.integer "time"
    t.text "instructions"
    t.integer "servings"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cooking_time"
  end

  create_table "size_conversions", force: :cascade do |t|
    t.integer "ingredient_id"
    t.string "unit"
    t.float "gram_equivalent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "amount"
    t.index ["ingredient_id"], name: "index_size_conversions_on_ingredient_id"
  end

end
