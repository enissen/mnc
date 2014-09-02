class Image < ActiveRecord::Base
  translates :name, :material, :description

  has_attached_file :file, styles: { medium: "800x800", thumb: "300x300" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :file, content_type: /\Aimage\/.*\Z/

  has_many :image_attachments
  has_many :galleries, through: :image_attachments
end
