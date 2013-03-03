class RemoveEmailFromEntry < ActiveRecord::Migration
  def up
    remove_column :entries, :email
  end

  def down
    add_column :entries, :email, :string
  end
end
