class AddColumnsToViews < ActiveRecord::Migration[7.0]
  def change
    add_column :views, :access_token, :string
    add_column :views, :expires_at, :datetime
    add_column :views, :refresh_token, :string
  end
end
