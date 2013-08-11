class RemoveMailFromUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :mail
  end
end
