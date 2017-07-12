# rails-module-tagging-multiple
> Tagging Multiple Models

## step by step:
1. create migrate:
```bash
rails g model Tag name:string
rails g model Episode name:string content:text
rails g model Article name:string content:text
rails g model Tagging tag_id:integer taggable_id:integer taggable_type:string
rake db:migrate
```
2. models
```rb
# model/concerns/taggable.rb
module Taggable
  extend ActiveSupport::Concern

  included do
    has_many :taggings, :as => :taggable
    has_many :tags, :through => :taggings
  end  

  def tag_list
    tags.map(&:name).join(', ')
  end

  def tag_list=(names)
    self.tags = names.split(',').map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end

  module ClassMethods
    def tag_counts
      Tag.select('tags.*, count(taggings.tag_id) as count').joins(:taggings).group('taggings.tag_id')
    end
  end
end

# model/article.rb
class Article < ApplicationRecord
    include Taggable
    def self.tagged_with(name)
        Tag.find_by!(name: name).articles
    end
end


# model/episode.rb
class Episode < ApplicationRecord
    include Taggable
    def self.tagged_with(name)
        Tag.find_by!(name: name).episodes
    end
end


# model/tag.rb
class Tag < ApplicationRecord
    has_many :taggings
    has_many :episodes, through: :taggings, source: :taggable, source_type: Episode
    has_many :articles, through: :taggings, source: :taggable, source_type: Article
end

# model/tagging.rb
class Tagging < ApplicationRecord
    belongs_to :tag
    belongs_to :taggable, :polymorphic => true
end

```

## reset:
```bash
rake db:drop && rake db:migrate && rake db:seed
```

## problems[tagging is invalid error]:
```rb
# model/tagging.rb [optional: true]
class Tagging < ApplicationRecord
    belongs_to :tag
    belongs_to :taggable, :polymorphic => true, optional: true
end
```

## resources:
+ https://rubyplus.com/articles/5091-Tagging-Multiple-Models-from-Scratch-in-Rails-5
+ https://github.com/bradphelan/rocket_tag
+ https://www.ruby-toolbox.com/categories/rails_tagging.html
+ https://github.com/jamesgolick/is_taggable
+ https://github.com/mbleigh/acts-as-taggable-on
+ http://blog.csdn.net/dazhi_100/article/details/9491497