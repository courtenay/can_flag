class <%= migration_name %> < ActiveRecord::Migration
  def self.up
    create_table "flags", :force => true do |t|
      t.integer :user_id
      t.integer :flaggable_id
      t.string :flaggable_type
      t.timestamps
    end
  end

  def self.down
    drop_table "flags"
  end
end
