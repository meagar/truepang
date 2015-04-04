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

ActiveRecord::Schema.define(version: 6) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "elo_ratings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "match_id"
    t.float    "in"
    t.float    "out"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "elo_ratings", ["match_id"], name: "index_elo_ratings_on_match_id", using: :btree
  add_index "elo_ratings", ["user_id"], name: "index_elo_ratings_on_user_id", using: :btree

  create_table "game_scores", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "player_id"
    t.integer  "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "game_scores", ["game_id"], name: "index_game_scores_on_game_id", using: :btree
  add_index "game_scores", ["player_id"], name: "index_game_scores_on_player_id", using: :btree

  create_table "games", force: :cascade do |t|
    t.integer  "match_id"
    t.datetime "finished_at"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "games", ["match_id"], name: "index_games_on_match_id", using: :btree

  create_table "matches", force: :cascade do |t|
    t.datetime "finished_at"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "players", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "match_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "players", ["match_id"], name: "index_players_on_match_id", using: :btree
  add_index "players", ["user_id"], name: "index_players_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                     null: false
    t.string   "name",                      null: false
    t.string   "username",                  null: false
    t.string   "image"
    t.string   "uid",                       null: false
    t.float    "elo_rating"
    t.boolean  "active",     default: true, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_foreign_key "elo_ratings", "matches"
  add_foreign_key "elo_ratings", "users"
  add_foreign_key "game_scores", "games"
  add_foreign_key "game_scores", "players"
  add_foreign_key "games", "matches"
  add_foreign_key "players", "matches"
  add_foreign_key "players", "users"
end
