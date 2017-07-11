class Tag < ApplicationRecord
    has_many :taggings
    has_many :episodes, through: :taggings, source: :taggable, source_type: Episode
    has_many :articles, through: :taggings, source: :taggable, source_type: Article
end
