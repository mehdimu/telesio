class AddReferencesToStream < ActiveRecord::Migration
  def change
    add_reference :streams, :channel, index: true, foreign_key: true
  end
end
