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

ActiveRecord::Schema.define(version: 20150404180953) do

  create_table "etf_holdings", force: true do |t|
    t.integer  "etf_id"
    t.integer  "holding_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "etf_holdings", ["etf_id"], name: "index_etf_holdings_on_etf_id"
  add_index "etf_holdings", ["holding_id"], name: "index_etf_holdings_on_holding_id"

  create_table "etfs", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "historical_assets", force: true do |t|
    t.integer  "value"
    t.string   "asset_date"
    t.integer  "etf_holding_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "historical_assets", ["etf_holding_id"], name: "index_historical_assets_on_etf_holding_id"

  create_table "historical_percentages", force: true do |t|
    t.decimal  "value",           precision: 18, scale: 4
    t.string   "percentage_date"
    t.integer  "etf_holding_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "historical_percentages", ["etf_holding_id"], name: "index_historical_percentages_on_etf_holding_id"

  create_table "historical_prices", force: true do |t|
    t.integer  "priceable_id"
    t.string   "priceable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "price_date",     limit: 255
    t.decimal  "open",                       precision: 18, scale: 4
    t.decimal  "close",                      precision: 18, scale: 4
    t.decimal  "low",                        precision: 18, scale: 4
    t.decimal  "high",                       precision: 18, scale: 4
    t.integer  "volume"
  end

  add_index "historical_prices", ["priceable_id"], name: "index_historical_prices_on_priceable_id"

  create_table "holdings", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
