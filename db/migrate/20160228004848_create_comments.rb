class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :post_id
      t.string :user_id
      t.text :content
      t.integer :votes

      t.timestamps
    end
  end
end
