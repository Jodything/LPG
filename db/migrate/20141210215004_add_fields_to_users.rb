class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :avatar, :string
    add_column :users, :title, :string
    add_column :users, :company, :string
  end
end
