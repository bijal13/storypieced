class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :country
      t.string :bio

      t.timestamps
    end
  end
end
