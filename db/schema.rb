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

ActiveRecord::Schema.define(version: 20150414100534) do

  create_table "ACCOUNT", primary_key: "AccountID", force: :cascade do |t|
    t.integer  "BranchID",      limit: 4,                           null: false
    t.char     "AccountNumber", limit: 20,                          null: false
    t.char     "AccountType",   limit: 12,                          null: false
    t.money    "Balance",                  precision: 19, scale: 4, null: false
    t.datetime "ModifiedDate"
    t.varchar  "AccountName",   limit: 50,                          null: false
    t.varchar  "AccountStatus", limit: 10,                          null: false
  end

  add_index "ACCOUNT", ["AccountID"], name: "UQ__ACCOUNT__349DA5870F975522", unique: true
  add_index "ACCOUNT", ["AccountNumber"], name: "UQ__ACCOUNT__BE2ACD6F0CBAE877", unique: true

  create_table "Borrower", primary_key: "CustomerID", force: :cascade do |t|
    t.integer  "LoanID",       limit: 4, null: false
    t.datetime "ModifiedDate"
  end

  create_table "Branch", primary_key: "BranchID", force: :cascade do |t|
    t.char     "BranchName",   limit: 32,                          null: false
    t.char     "BranchCity",   limit: 32,                          null: false
    t.money    "Assets",                  precision: 19, scale: 4, null: false
    t.datetime "ModifiedDate"
  end

  add_index "Branch", ["BranchID"], name: "UQ__Branch__A1682FA40519C6AF", unique: true
  add_index "Branch", ["BranchName"], name: "UQ__Branch__3903DB03023D5A04", unique: true

  create_table "Customer", primary_key: "CustomerID", force: :cascade do |t|
    t.char     "Name",         limit: 32, null: false
    t.char     "Type",         limit: 20, null: false
    t.varchar  "Street",       limit: 32, null: false
    t.char     "City",         limit: 32, null: false
    t.char     "State",        limit: 32, null: false
    t.char     "Zip",          limit: 10, null: false
    t.char     "Country",      limit: 32, null: false
    t.datetime "ModifiedDate"
  end

  add_index "Customer", ["CustomerID"], name: "UQ__Customer__A4AE64B91BFD2C07", unique: true
  add_index "Customer", ["Name"], name: "UQ__Customer__737584F61920BF5C", unique: true

  create_table "Depositor", primary_key: "CustomerID", force: :cascade do |t|
    t.integer  "AccountID",    limit: 4, null: false
    t.datetime "ModifiedDate"
  end

  create_table "Loan", primary_key: "LoanID", force: :cascade do |t|
    t.integer  "BranchID",     limit: 4,                           null: false
    t.char     "LoanNumber",   limit: 20,                          null: false
    t.varchar  "LoanType",     limit: 30,                          null: false
    t.money    "Amount",                  precision: 19, scale: 4, null: false
    t.datetime "ModifiedDate"
  end

  add_index "Loan", ["LoanID"], name: "UQ__Loan__4F5AD436267ABA7A", unique: true
  add_index "Loan", ["LoanNumber"], name: "UQ__Loan__EEC26628239E4DCF", unique: true

  create_table "Student", primary_key: "ID", force: :cascade do |t|
    t.varchar "NAME", limit: 50
    t.integer "AGE",  limit: 4
  end

  create_table "Test_Ex", id: false, force: :cascade do |t|
    t.decimal "id",                precision: 18, scale: 0, null: false
    t.varchar "name",   limit: 50
    t.string  "email",  limit: 50
    t.decimal "cellno",            precision: 18, scale: 0
  end

  create_table "Transaction", primary_key: "TransactionID", force: :cascade do |t|
    t.integer  "AccountID",    limit: 4
    t.char     "TranType",     limit: 1
    t.money    "Amount",                 precision: 19, scale: 4
    t.datetime "ModifiedDate"
  end

  create_table "blogs", force: :cascade do |t|
    t.string   "title",      limit: 4000
    t.string   "subject",    limit: 4000
    t.text     "content",    limit: 2147483647
    t.string   "tag",        limit: 4000
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "emp1", id: false, force: :cascade do |t|
    t.integer "id",   limit: 4,  null: false
    t.varchar "name", limit: 50
    t.integer "age",  limit: 4
  end

  add_foreign_key "ACCOUNT", "Branch", column: "BranchID", primary_key: "BranchID", name: "FK__ACCOUNT__BranchI__1367E606", on_delete: :cascade
  add_foreign_key "Borrower", "Customer", column: "CustomerID", primary_key: "CustomerID", name: "FK__Borrower__Custom__35BCFE0A"
  add_foreign_key "Borrower", "Loan", column: "LoanID", primary_key: "LoanID", name: "FK__Borrower__LoanID__36B12243"
  add_foreign_key "Depositor", "ACCOUNT", column: "AccountID", primary_key: "AccountID", name: "FK__Depositor__Accou__2F10007B", on_delete: :cascade
  add_foreign_key "Depositor", "Customer", column: "CustomerID", primary_key: "CustomerID", name: "FK__Depositor__Custo__300424B4"
  add_foreign_key "Loan", "Branch", column: "BranchID", primary_key: "BranchID", name: "FK__Loan__BranchID__286302EC", on_delete: :cascade
  add_foreign_key "Transaction", "ACCOUNT", column: "AccountID", primary_key: "AccountID", name: "FK__Transacti__Accou__3C69FB99", on_delete: :cascade
end
