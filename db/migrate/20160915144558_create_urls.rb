class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :long_url, null: false
      t.string :short_url, null: false
      t.integer :counter, null: false, default: 0
      t.integer :creator_id

      t.timestamps(null: false)
    end
  end
end
