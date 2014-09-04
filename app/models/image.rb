class Image < ActiveRecord::Base
  translates :name, :material, :description
  has_attached_file :file,  styles:          {large: '1024x1024>', thumb: '300x300'},
                            convert_options: {thumb: '-quality 75 -strip'},
                            processors:      [:cropper]
  validates_attachment_content_type :file, content_type: /\Aimage\/.*\Z/
  has_many :image_attachments
  has_many :galleries, through: :image_attachments
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h

  def file_geometry(style = :original)
    @geometry        ||= {}
    @geometry[style] ||= Paperclip::Geometry.from_file(file.path(style))
  end

  def reprocess_file(x, y, w, h)
    self.crop_x = x
    self.crop_y = y
    self.crop_w = w
    self.crop_h = h
    self.file.reprocess! :thumb
  end

  def data
    data = ""
    data << self.dimension if self.dimension.present?
    data << ' - ' if self.dimension.present? && self.material.present?
    data << self.material if self.material.present?
  end
end
