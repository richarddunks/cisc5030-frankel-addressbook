class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :type
      t.string :address
      t.belongs_to :entry
      t.belongs_to :address_type

      t.timestamps
    end
    add_index :urls, [:entry_id, :type]
  end
end
