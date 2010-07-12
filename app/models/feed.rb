class Feed < ActiveRecord::Base
  attr_accessible :name, :yql_query, :atom_link_href, :link, :description, :language, :lastBuildDate, :sy_updatePeriod, :sy_updateFrequency, :itunes_summary, :itunes_subtitle, :itunes_author, :itunes_image_href, :image_url, :image_link, :itunes_category, :itunes_keywords, :itunes_explicit, :itunes_owner_name, :itunes_owner_email
end
