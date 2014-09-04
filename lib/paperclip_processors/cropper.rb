module Paperclip
  class Cropper < Thumbnail
    def transformation_command
      if crop_command
        crop_command + super.join(' ').sub(/ -crop \S+/, '')
      else
        super
      end
    end

    def crop_command
      target = @attachment.instance
      if cropping?(target)
        " -crop '#{target.crop_w.to_i}x#{target.crop_h.to_i}+#{target.crop_x.to_i}+#{target.crop_y.to_i}' "
      end
    end

    def cropping?(target)
      target.crop_w.present? && target.crop_h.present? &&
      target.crop_x.present? && target.crop_y.present?
    end
  end
end
