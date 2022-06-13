class AddVideoToWorkshop < ActiveRecord::Migration[7.0]
  def change
    add_column :workshops, :video, :string
  end
end
