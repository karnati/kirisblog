class CreateAdminFlashGames < ActiveRecord::Migration
  def self.up
    create_table :admin_flash_games do |t|
      t.string :name
      t.string :code

      t.timestamps
    end
  end

  def self.down
    drop_table :admin_flash_games
  end
end
