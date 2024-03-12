class AddLocationToProperties < ActiveRecord::Migration[7.1]
  def change
    add_column :properties, :location, :string
  end
end
