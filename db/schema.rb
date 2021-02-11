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

ActiveRecord::Schema.define(version: 2021_01_30_090401) do

  create_table "active_storage_attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "answers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "answer", null: false
    t.date "answer_day"
    t.bigint "user_id"
    t.bigint "definition_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["definition_id"], name: "index_answers_on_definition_id"
    t.index ["user_id"], name: "index_answers_on_user_id"
  end

  create_table "comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "comment", null: false
    t.bigint "user_id"
    t.bigint "definition_id"
    t.bigint "answer_id"
    t.bigint "p_definition_id"
    t.bigint "p_answer_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["answer_id"], name: "index_comments_on_answer_id"
    t.index ["definition_id"], name: "index_comments_on_definition_id"
    t.index ["p_answer_id"], name: "index_comments_on_p_answer_id"
    t.index ["p_definition_id"], name: "index_comments_on_p_definition_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "definitions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "title", null: false
    t.text "body", null: false
    t.date "definition_day"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_definitions_on_user_id"
  end

  create_table "likes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "answer_id"
    t.bigint "definition_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["answer_id"], name: "index_likes_on_answer_id"
    t.index ["definition_id"], name: "index_likes_on_definition_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "notifications", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "visitor_id", null: false
    t.bigint "visited_id", null: false
    t.bigint "definition_id"
    t.bigint "p_definition_id"
    t.bigint "answer_id"
    t.bigint "p_answer_id"
    t.string "action", null: false
    t.boolean "checked", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["answer_id"], name: "index_notifications_on_answer_id"
    t.index ["definition_id"], name: "index_notifications_on_definition_id"
    t.index ["p_answer_id"], name: "index_notifications_on_p_answer_id"
    t.index ["p_definition_id"], name: "index_notifications_on_p_definition_id"
    t.index ["visited_id"], name: "index_notifications_on_visited_id"
    t.index ["visitor_id"], name: "index_notifications_on_visitor_id"
  end

  create_table "p_answers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "answer", null: false
    t.date "answer_day"
    t.bigint "user_id"
    t.bigint "p_definition_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["p_definition_id"], name: "index_p_answers_on_p_definition_id"
    t.index ["user_id"], name: "index_p_answers_on_user_id"
  end

  create_table "p_definitions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "title", null: false
    t.text "body", null: false
    t.date "definition_day"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_p_definitions_on_user_id"
  end

  create_table "p_likes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "p_answer_id"
    t.bigint "p_definition_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["p_answer_id"], name: "index_p_likes_on_p_answer_id"
    t.index ["p_definition_id"], name: "index_p_likes_on_p_definition_id"
    t.index ["user_id"], name: "index_p_likes_on_user_id"
  end

  create_table "p_reviews", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "content"
    t.integer "score"
    t.bigint "user_id"
    t.bigint "p_definition_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["p_definition_id"], name: "index_p_reviews_on_p_definition_id"
    t.index ["user_id"], name: "index_p_reviews_on_user_id"
  end

  create_table "relationships", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followed_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reviews", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "content"
    t.integer "score"
    t.bigint "user_id"
    t.bigint "definition_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["definition_id"], name: "index_reviews_on_definition_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "nickname", null: false
    t.text "occupation", null: false
    t.text "position", null: false
    t.date "birth_day", null: false
    t.integer "sex_id", null: false
    t.boolean "admin", default: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "answers", "definitions"
  add_foreign_key "answers", "users"
  add_foreign_key "comments", "answers"
  add_foreign_key "comments", "definitions"
  add_foreign_key "comments", "p_answers"
  add_foreign_key "comments", "p_definitions"
  add_foreign_key "comments", "users"
  add_foreign_key "definitions", "users"
  add_foreign_key "likes", "answers"
  add_foreign_key "likes", "definitions"
  add_foreign_key "likes", "users"
  add_foreign_key "notifications", "answers"
  add_foreign_key "notifications", "definitions"
  add_foreign_key "notifications", "p_answers"
  add_foreign_key "notifications", "p_definitions"
  add_foreign_key "notifications", "users", column: "visited_id"
  add_foreign_key "notifications", "users", column: "visitor_id"
  add_foreign_key "p_answers", "p_definitions"
  add_foreign_key "p_answers", "users"
  add_foreign_key "p_definitions", "users"
  add_foreign_key "p_likes", "p_answers"
  add_foreign_key "p_likes", "p_definitions"
  add_foreign_key "p_likes", "users"
  add_foreign_key "p_reviews", "p_definitions"
  add_foreign_key "p_reviews", "users"
  add_foreign_key "reviews", "definitions"
  add_foreign_key "reviews", "users"
end
