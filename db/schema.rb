# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100712011703) do

  create_table "feeds", :force => true do |t|
    t.string   "name"
    t.text     "yql_query"
    t.string   "atom_link_href"
    t.string   "link"
    t.text     "description"
    t.string   "language"
    t.date     "lastBuildDate"
    t.string   "sy_updatePeriod"
    t.string   "sy_updateFrequency"
    t.text     "itunes_summary"
    t.string   "itunes_subtitle"
    t.string   "itunes_author"
    t.text     "itunes_image_href"
    t.text     "image_url"
    t.text     "image_link"
    t.string   "itunes_category"
    t.string   "itunes_keywords"
    t.string   "itunes_explicit"
    t.string   "itunes_owner_name"
    t.string   "itunes_owner_email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
