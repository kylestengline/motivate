class DropContact < ActiveRecord::Migration[5.0]
  def change
  	drop_table :contact
  end
end
