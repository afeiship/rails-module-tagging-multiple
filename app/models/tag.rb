class Tag < ApplicationRecord
    has_many :taggings, dependent: :destroy
    has_many :articles, through: :taggings, :source => :taggable, :source_type => 'Article'
    has_many :episodes, through: :taggings, :source => :taggable, :source_type => 'Episode'
end
