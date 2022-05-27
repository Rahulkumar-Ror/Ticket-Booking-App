class AddRoleToView < ActiveRecord::Migration[7.0]
  def change
    add_column :views, :role, :string
  end
end
