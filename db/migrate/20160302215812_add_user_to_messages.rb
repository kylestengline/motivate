class AddUserToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :user, :string
  end
end
