class Gallery < ActiveRecord::Base
  translates :title, :description

  has_attached_file :picture, styles: { medium: "300x300", thumb: "100x100" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/

  has_many :image_attachments
  has_many :images, through: :image_attachments
end
