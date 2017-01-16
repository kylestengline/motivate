class AddAdministratorRefToPosts < ActiveRecord::Migration[5.0]
  def change
    add_reference :posts, :administrator, foreign_key: true
  end
end
