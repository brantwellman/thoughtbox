class AddDefaultValueToReadOnLinks < ActiveRecord::Migration
  def change
    change_column :links, :read, :boolean, :default => false
  end
end
