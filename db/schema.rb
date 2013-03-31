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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130331024211) do

  create_table "answers", :force => true do |t|
    t.string   "text"
    t.string   "answer_type"
    t.boolean  "correct"
    t.integer  "questions_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "answers", ["questions_id"], :name => "index_answers_on_questions_id"

  create_table "assignments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "question_group_questions", :force => true do |t|
    t.integer  "question_id"
    t.integer  "question_group_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "question_groups", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "question_groups_type"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "question_groups", ["name"], :name => "index_question_groups_on_name"

  create_table "questions", :force => true do |t|
    t.string   "text"
    t.integer  "category_id"
    t.integer  "question_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.boolean  "open"
  end

  create_table "responses", :force => true do |t|
    t.integer  "answer_id"
    t.integer  "question_id"
    t.integer  "user_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "question_group_id"
  end

  add_index "responses", ["answer_id"], :name => "index_responses_on_answer_id"
  add_index "responses", ["question_id"], :name => "index_responses_on_question_id"
  add_index "responses", ["user_id", "question_id"], :name => "index_responses_on_user_id_and_question_id", :unique => true
  add_index "responses", ["user_id"], :name => "index_responses_on_user_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "user_sessions", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.integer  "login_count",       :default => 0
    t.string   "login_ip"
    t.datetime "last_request_at"
  end

end
