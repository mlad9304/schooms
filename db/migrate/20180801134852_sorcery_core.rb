class SorceryCore < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :iin, :string, null: false
    add_column :users, :crypted_password, :string
    add_column :users, :salt, :string

    add_index :users, :iin, unique: true
  end
end
