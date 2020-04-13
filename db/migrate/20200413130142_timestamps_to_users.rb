class TimestampsToUsers < ActiveRecord::Migration[6.0]
  def change
    change_table(:users) { |t| t.timestamps }
    rename_column :users, :name, :first_name
  end
end
