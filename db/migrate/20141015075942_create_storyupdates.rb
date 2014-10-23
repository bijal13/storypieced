class CreateStoryupdates < ActiveRecord::Migration
  def change
    create_table :storyupdates do |t|
      t.string :text
      t.string :write
      t.timestamps
      t.integer :user_id
      t.integer :story_id

    end
  end
end
