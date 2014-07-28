class AddTables < ActiveRecord::Migration
  
  def change
  	create_table :users do |t|
    t.string   :email,                  default: "",    null: false
    t.string   :password_digest,     default: "",    null: false
    t.string   :reset_password_token
    t.datetime :reset_password_sent_at
    t.datetime :remember_created_at
    t.string   :current_sign_in_ip
    t.string   :last_sign_in_ip
    t.datetime :created_at
    t.datetime :updated_at
    t.string   :name
    t.boolean  :admin,                  default: false
		t.string	 :phonenumber
  	end

	add_index :users, [:email], name: :index_users_on_email, unique: true, using: :btree
  	add_index :users, [:reset_password_token], name: :index_users_on_reset_password_token, unique: true, using: :btree

  	create_table :gallery_images, force: true do |t|
    t.string   :name
    t.string   :description
    t.string   :image
    t.datetime :created_at
    t.datetime :updated_at
  end

  create_table :images, force: true do |t|
    t.string   :name
    t.string   :description
    t.string   :image
    t.integer  :user_id,     null: false
    t.datetime :created_at
    t.datetime :updated_at
  end

  create_table :messages, force: true do |t|
    t.string   :title
    t.text     :content
    t.datetime :created_at
    t.datetime :updated_at
    t.integer  :user_id,    null: false
  end

  create_table :posts, force: true do |t|
    t.string   :title
    t.text     :content
    t.datetime :created_at
    t.datetime :updated_at
  end
  
  end
end
