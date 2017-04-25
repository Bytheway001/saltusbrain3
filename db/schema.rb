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

ActiveRecord::Schema.define(version: 20170424010637) do

  create_table "academies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cargos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "persona_id"
    t.integer  "empresa_id"
    t.string   "nombre"
    t.date     "inicio"
    t.date     "fin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "current"
    t.index ["empresa_id"], name: "index_cargos_on_empresa_id", using: :btree
    t.index ["persona_id"], name: "index_cargos_on_persona_id", using: :btree
  end

  create_table "courses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "persona_id"
    t.integer  "academy_id"
    t.string   "nombre"
    t.date     "inicio"
    t.date     "fin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "current"
    t.index ["academy_id"], name: "index_courses_on_academy_id", using: :btree
    t.index ["persona_id"], name: "index_courses_on_persona_id", using: :btree
  end

  create_table "empresas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nombre"
    t.text     "direccion",  limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "hobbies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nombre"
    t.integer  "persona_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["persona_id"], name: "index_hobbies_on_persona_id", using: :btree
  end

  create_table "personas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nombre"
    t.string   "apellido"
    t.string   "email"
    t.string   "direccion"
    t.integer  "user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "country"
    t.string   "segundo_nombre"
    t.string   "telefono_fijo"
    t.string   "telefono_celular"
    t.boolean  "sexo"
    t.string   "edo_civil"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "instagram"
    t.string   "github"
    t.string   "linkedin"
    t.string   "profesion"
    t.string   "padre"
    t.string   "madre"
    t.string   "fecha_nac"
    t.index ["user_id"], name: "index_personas_on_user_id", using: :btree
  end

  create_table "schools", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "studies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "school_id"
    t.integer  "persona_id"
    t.string   "titulo"
    t.date     "inicio"
    t.date     "fin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "current"
    t.index ["persona_id"], name: "index_studies_on_persona_id", using: :btree
    t.index ["school_id"], name: "index_studies_on_school_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "cargos", "empresas"
  add_foreign_key "cargos", "personas"
  add_foreign_key "courses", "academies"
  add_foreign_key "courses", "personas"
  add_foreign_key "hobbies", "personas"
  add_foreign_key "personas", "users"
  add_foreign_key "studies", "personas"
  add_foreign_key "studies", "schools"
end
