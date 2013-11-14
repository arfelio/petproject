class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.attachment :asset
      t.integer :attachable_id
      t.integer :attachable_type
      t.timestamps
    end
  end
end
