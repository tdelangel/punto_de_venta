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

  create_table "clients", force: :cascade do |t|
    t.string   "cedula",     limit: 255, null: false
    t.string   "nombres",    limit: 255, null: false
    t.string   "direccion",  limit: 255
    t.string   "telefono",   limit: 255
    t.string   "correo",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "nombre",     limit: 255,                null: false
    t.decimal  "precio",                 precision: 10, null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "sale_details", force: :cascade do |t|
    t.integer  "sale_id",    limit: 4
    t.integer  "product_id", limit: 4
    t.integer  "cantidad",   limit: 4,                null: false
    t.decimal  "total",                precision: 10, null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "sale_details", ["product_id"], name: "index_sale_details_on_product_id", using: :btree
  add_index "sale_details", ["sale_id"], name: "index_sale_details_on_sale_id", using: :btree

  create_table "sales", force: :cascade do |t|
    t.date     "fecha"
    t.decimal  "subtotal",             precision: 10
    t.decimal  "total",                precision: 10
    t.integer  "client_id",  limit: 4,                null: false
    t.integer  "user_id",    limit: 4,                null: false
    t.boolean  "estado",     limit: 1
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "sales", ["client_id"], name: "index_sales_on_client_id", using: :btree
  add_index "sales", ["user_id"], name: "index_sales_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "nombres",                      limit: 255,   null: false
    t.string   "direccion",                    limit: 255
    t.string   "telefono",                     limit: 255
    t.boolean  "sexo",                         limit: 1
    t.boolean  "activo",                       limit: 1
    t.text     "observacion",                  limit: 65535
    t.string   "foto",                         limit: 255
    t.string   "email",                        limit: 255,   null: false
    t.string   "crypted_password",             limit: 255
    t.string   "salt",                         limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_me_token",            limit: 255
    t.datetime "remember_me_token_expires_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_me_token"], name: "index_users_on_remember_me_token", using: :btree

  add_foreign_key "sale_details", "products"
  add_foreign_key "sale_details", "sales"
  add_foreign_key "sales", "clients"
  add_foreign_key "sales", "users"
end
