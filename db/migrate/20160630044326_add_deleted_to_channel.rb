class AddDeletedToChannel < ActiveRecord::Migration
  def change
    add_column :channels, :deleted, :boolean, :default => false
  end
end
