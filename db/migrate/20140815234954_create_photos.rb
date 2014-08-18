class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos, force: true do |t|
			t.string :name
			t.string :description
			t.string :image
			t.integer :user_id, null: false
			t.timestamps
    end
  end
end
