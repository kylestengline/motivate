class AdministratorRefToPosts < ActiveRecord::Migration[5.0]
  def change
  	add_reference :posts, :administrator, index: true, foreign_key: true
  end
end
