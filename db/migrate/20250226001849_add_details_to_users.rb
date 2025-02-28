class AddDetailsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string, null: false, default: ""
    add_column :users, :profile_image, :string
    add_column :users, :bio, :text
  end
end
