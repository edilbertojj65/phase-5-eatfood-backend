class CreatePhotos < ActiveRecord::Migration[6.1]
  def change
    create_table :photos do |t|
      t.string :namePhoto
      t.string :url
      t.binary :data
      t.string :fileName
      t.string :mimeType
      t.references :user, null: false, foreign_key: true
      t.references :group_user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
