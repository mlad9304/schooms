class CreateRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :roles do |t|
      t.integer :user_id
      t.string :kind

      t.timestamps
    end

    add_index :roles, %i[user_id kind], unique: true
  end
end
