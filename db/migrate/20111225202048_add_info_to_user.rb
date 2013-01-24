class AddInfoToUser < ActiveRecord::Migration
  def change
    add_column :users, :bio, :text
    add_column :users, :fname, :string
    add_column :users, :lname, :string
    add_column :users, :imcanvas, :boolean, :default => false
    add_column :users, :imartist, :boolean, :default => false
  end
end
