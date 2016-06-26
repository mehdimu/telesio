class CreateStreams < ActiveRecord::Migration
  def change
    create_table :streams do |t|
      t.string :url
      t.string :source
      t.boolean :live

      t.timestamps null: false
    end
  end
end
