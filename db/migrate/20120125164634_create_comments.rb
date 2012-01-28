class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.references :article ,   :null => false
      t.string :name        ,   :null => false
      t.string :email       ,   :null => false
      t.string :website
      t.string :description ,   :null => false

      t.timestamps
    end
    add_index :comments , :article_id
  end

  def self.down
    drop_table :comments
    remove_index :comments , :article_id
  end
end
