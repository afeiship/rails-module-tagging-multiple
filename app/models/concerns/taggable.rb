module Taggable
  extend ActiveSupport::Concern

  included do
    has_many :taggings, :as => :taggable
    has_many :tags, :through => :taggings
  end

  def tag_list
    tags.map(&:name).join(', ')
  end
end
