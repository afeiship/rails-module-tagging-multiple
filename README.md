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
2. 



## resources:
+ https://rubyplus.com/articles/5091-Tagging-Multiple-Models-from-Scratch-in-Rails-5
+ https://github.com/bradphelan/rocket_tag
+ https://www.ruby-toolbox.com/categories/rails_tagging.html
+ https://github.com/jamesgolick/is_taggable
+ https://github.com/mbleigh/acts-as-taggable-on
+ http://blog.csdn.net/dazhi_100/article/details/9491497