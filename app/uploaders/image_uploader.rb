# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  include Cloudinary::CarrierWave

  version :medium do
      process :eager => true
      process :resize_to_fill => [300,300]
    end
end
