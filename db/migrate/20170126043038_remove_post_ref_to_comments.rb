class RemovePostRefToComments < ActiveRecord::Migration[5.0]
  def change
    remove_reference :comments, :post, foreign_key: true
  end
end
