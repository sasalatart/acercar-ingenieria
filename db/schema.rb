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

ActiveRecord::Schema.define(version: 20161221184559) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "article_categories", force: :cascade do |t|
    t.integer  "article_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["article_id"], name: "index_article_categories_on_article_id", using: :btree
    t.index ["category_id"], name: "index_article_categories_on_category_id", using: :btree
  end

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.text     "short_description"
    t.text     "content"
    t.integer  "major_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["major_id"], name: "index_articles_on_major_id", using: :btree
  end

  create_table "attachments", force: :cascade do |t|
    t.string   "attachable_type"
    t.integer  "attachable_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
    t.index ["attachable_type", "attachable_id"], name: "index_attachments_on_attachable_type_and_attachable_id", using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.string   "commentable_type"
    t.integer  "commentable_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "distinguished_section_admins", force: :cascade do |t|
    t.integer  "distinguished_section_id"
    t.integer  "user_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["distinguished_section_id"], name: "index_distinguished_section_admins_on_distinguished_section_id", using: :btree
    t.index ["user_id"], name: "index_distinguished_section_admins_on_user_id", using: :btree
  end

  create_table "distinguished_sections", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "distinguished_virtual_rooms", force: :cascade do |t|
    t.integer  "distinguished_section_id"
    t.integer  "virtual_room_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["distinguished_section_id"], name: "index_distinguished_virtual_rooms_on_distinguished_section_id", using: :btree
    t.index ["virtual_room_id"], name: "index_distinguished_virtual_rooms_on_virtual_room_id", using: :btree
  end

  create_table "enrollments", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "enrollable_type"
    t.integer  "enrollable_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["enrollable_type", "enrollable_id"], name: "index_enrollments_on_enrollable_type_and_enrollable_id", using: :btree
    t.index ["user_id"], name: "index_enrollments_on_user_id", using: :btree
  end

  create_table "faqs", force: :cascade do |t|
    t.string   "question"
    t.string   "answer"
    t.boolean  "frequent",   default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "impressions", force: :cascade do |t|
    t.string   "ip_address"
    t.integer  "user_id"
    t.string   "impressionable_type"
    t.integer  "impressionable_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["impressionable_type", "impressionable_id"], name: "index_impressions_on_impressionable_type_and_impressionable_id", using: :btree
    t.index ["user_id"], name: "index_impressions_on_user_id", using: :btree
  end

  create_table "landing_photos", force: :cascade do |t|
    t.string   "title",              default: ""
    t.text     "text",               default: ""
    t.boolean  "pinned",             default: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "major_admins", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "major_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["major_id"], name: "index_major_admins_on_major_id", using: :btree
    t.index ["user_id"], name: "index_major_admins_on_user_id", using: :btree
  end

  create_table "major_faqs", force: :cascade do |t|
    t.string   "question"
    t.text     "answer"
    t.integer  "major_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["major_id"], name: "index_major_faqs_on_major_id", using: :btree
  end

  create_table "major_users", force: :cascade do |t|
    t.integer  "major_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["major_id"], name: "index_major_users_on_major_id", using: :btree
    t.index ["user_id"], name: "index_major_users_on_user_id", using: :btree
  end

  create_table "majors", force: :cascade do |t|
    t.string   "name"
    t.string   "category"
    t.text     "description"
    t.text     "short_description"
    t.string   "video_url_code"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
  end

  create_table "notifications", force: :cascade do |t|
    t.boolean  "read",                   default: false
    t.string   "action"
    t.integer  "notificator_admin_rank", default: 0
    t.integer  "user_id"
    t.integer  "notificator_id"
    t.string   "notifyable_type"
    t.integer  "notifyable_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["notificator_id"], name: "index_notifications_on_notificator_id", using: :btree
    t.index ["notifyable_type", "notifyable_id"], name: "index_notifications_on_notifyable_type_and_notifyable_id", using: :btree
    t.index ["user_id"], name: "index_notifications_on_user_id", using: :btree
  end

  create_table "rules", force: :cascade do |t|
    t.string   "category"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.string   "taggable_type"
    t.integer  "taggable_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
    t.index ["taggable_type", "taggable_id"], name: "index_taggings_on_taggable_type_and_taggable_id", using: :btree
  end

  create_table "tags", force: :cascade do |t|
    t.string   "category"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "topics", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "status",          default: "unarchived"
    t.integer  "user_admin_rank"
    t.integer  "user_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["user_id"], name: "index_topics_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "generation"
    t.boolean  "admin",                  default: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "virtual_rooms", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "link"
    t.datetime "date"
    t.string   "status",      default: "unarchived"
    t.integer  "user_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.index ["user_id"], name: "index_virtual_rooms_on_user_id", using: :btree
  end

  add_foreign_key "article_categories", "articles"
  add_foreign_key "article_categories", "categories"
  add_foreign_key "articles", "majors"
  add_foreign_key "comments", "users"
  add_foreign_key "distinguished_section_admins", "distinguished_sections"
  add_foreign_key "distinguished_section_admins", "users"
  add_foreign_key "distinguished_virtual_rooms", "distinguished_sections"
  add_foreign_key "distinguished_virtual_rooms", "virtual_rooms"
  add_foreign_key "enrollments", "users"
  add_foreign_key "impressions", "users"
  add_foreign_key "major_admins", "majors"
  add_foreign_key "major_admins", "users"
  add_foreign_key "major_faqs", "majors"
  add_foreign_key "major_users", "majors"
  add_foreign_key "major_users", "users"
  add_foreign_key "notifications", "users"
  add_foreign_key "taggings", "tags"
  add_foreign_key "topics", "users"
  add_foreign_key "virtual_rooms", "users"
end
