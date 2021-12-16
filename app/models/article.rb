class Article < ApplicationRecord
  include Taggable
  def self.tagged_with(name)
    Tag.find_by!(name: name).articles
  end
end
