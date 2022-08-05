class AddCustomerInfoToView < ActiveRecord::Migration[7.0]
  def change
    add_column :views, :subscription_status, :string
    add_column :views, :subscription_end_date, :datetime
    add_column :views, :subscription_start_date, :datetime
  end
end
