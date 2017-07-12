class Episode < ApplicationRecord
    # include Taggable
    # def self.tagged_with(name)
    #     Tag.find_by!(name: name).episodes
    # end

    has_many :taggings
    has_many :tags, :through => :taggings
end
