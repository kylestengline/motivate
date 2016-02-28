class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
  	rename_column :administrators, :password, :password_digest
  	rename_column :users, :password, :password_digest
  end
end
