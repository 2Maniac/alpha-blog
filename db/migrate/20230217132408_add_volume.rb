class AddVolume < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :volume, :integer
  end
end
