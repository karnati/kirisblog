class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.string :category    , :null => false
      t.string :title       , :null => false
      t.text :description   , :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :articles
  end
end
