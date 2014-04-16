class AddImageToGallery < ActiveRecord::Migration
  def self.up
    add_attachment :galleries, :picture
  end

  def self.down
    remove_attachment :galleries, :picture
  end
end
