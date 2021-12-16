class Episode < ApplicationRecord
  include Taggable
  def self.tagged_with(name)
    Tag.find_by!(name: name).episodes
  end
end
