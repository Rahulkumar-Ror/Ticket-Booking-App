class AddRoleToViews < ActiveRecord::Migration[7.0]
  def change
    add_column :views, :role, :string
    add_column :views, :full_name, :string
    add_column :views, :contact_number, :string
  end
end
