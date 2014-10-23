class AddTitleToStoryupdates < ActiveRecord::Migration
  def change
    add_column :storyupdates, :title, :string
  end
end
