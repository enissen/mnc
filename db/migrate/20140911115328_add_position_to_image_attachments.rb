class AddPositionToImageAttachments < ActiveRecord::Migration
  def change
    add_column :image_attachments, :position, :integer
  end
end
