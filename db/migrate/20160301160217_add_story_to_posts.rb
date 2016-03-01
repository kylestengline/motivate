class AddStoryToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :story, :text
  end
end
