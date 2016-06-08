class AddTSandDesc < ActiveRecord::Migration
  def change
    add_column :photos, :description, :string
    add_timestamps :photos
  end
end
