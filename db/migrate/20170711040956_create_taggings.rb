class CreateTaggings < ActiveRecord::Migration[5.1]
  def change
    create_table :taggings do |t|
      t.references :tag, foreign_key: true
      t.integer :taggable_id
      t.string :taggable_type

      t.timestamps
    end
    
    
  end
end
