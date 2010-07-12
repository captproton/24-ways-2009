class CreateFeeds < ActiveRecord::Migration
  def self.up
    create_table :feeds do |t|
      t.string :name
      t.text :yql_query
      t.string :atom_link_href
      t.string :link
      t.text :description
      t.string :language
      t.date :lastBuildDate
      t.string :sy_updatePeriod
      t.string :sy_updateFrequency
      t.text :itunes_summary
      t.string :itunes_subtitle
      t.string :itunes_author
      t.text :itunes_image_href
      t.text :image_url
      t.text :image_link
      t.string :itunes_category
      t.string :itunes_keywords
      t.string :itunes_explicit
      t.string :itunes_owner_name
      t.string :itunes_owner_email
      t.timestamps
    end
  end
  
  def self.down
    drop_table :feeds
  end
end
