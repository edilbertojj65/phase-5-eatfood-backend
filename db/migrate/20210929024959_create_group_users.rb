class CreateGroupUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :group_users do |t|
      t.string :name
      t.references :group, null: false, foreign_key: false

      t.timestamps
    end
  end
end
