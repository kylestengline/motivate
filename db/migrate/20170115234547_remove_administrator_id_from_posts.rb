class RemoveAdministratorIdFromPosts < ActiveRecord::Migration[5.0]
  def change
    remove_column :posts, :administrator_id, :string
  end
end
