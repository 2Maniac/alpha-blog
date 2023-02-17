class RemoveVolume < ActiveRecord::Migration[7.0]
  def change
    remove_column :articles, :volume
  end
end
