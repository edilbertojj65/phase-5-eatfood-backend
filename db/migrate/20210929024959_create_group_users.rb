class CreateGroupUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :group_users do |t|
      t.string :name
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
