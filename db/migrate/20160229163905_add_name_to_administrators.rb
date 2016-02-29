class AddNameToAdministrators < ActiveRecord::Migration[5.0]
  def change
    add_column :administrators, :name, :string
  end
end
