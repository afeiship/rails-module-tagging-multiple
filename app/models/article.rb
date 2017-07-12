class Article < ApplicationRecord
    # include Taggable
    # def self.tagged_with(name)
    #     Tag.find_by!(name: name).articles
    # end

    has_many :taggings, :as => :taggable
    has_many :tags, :through => :taggings

    def tag_list
        tags.map(&:name).join(', ')
    end

    def tag_list=(names)
        self.tags = names.split(',').map do |name|
        Tag.where(name: name.strip).first_or_create!
        end
    end
end
