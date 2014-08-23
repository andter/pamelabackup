class AddFbToUsers < ActiveRecord::Migration
  def change
		add_column :users, :fb, :boolean, default: false
  end
end
