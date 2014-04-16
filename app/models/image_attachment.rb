class ImageAttachment < ActiveRecord::Base
  belongs_to :image
  belongs_to :gallery
end
