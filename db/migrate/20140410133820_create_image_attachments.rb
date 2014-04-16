class CreateImageAttachments < ActiveRecord::Migration
  def change
    create_table :image_attachments do |t|
      t.integer :gallery_id
      t.integer :image_id

      t.timestamps
    end
  end
end
