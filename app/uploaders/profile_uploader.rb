# encoding: utf-8

class ProfileUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick
  #include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  #storage :file
  storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

	def cache_dir
		"#{Rails.root}/tmp/uploads"
	end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
	version :default_photo do
		process :resize_to_fill => [600, 600]
	end

	version :profile_pic do
		process :manualcrop
		process :resize_to_limit => [250, 331]
	end

	version :default_photo_limit do
		process :resize_to_limit => [600, 600]
	end

	version :profile_pic_thumb do
		process :resize_to_fill => [200, 114]
	end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
	def extension_white_list
		%w(jpg jpeg gif png)
	end

	def manualcrop
    return unless model.cropping?
			manipulate! do |img| 
				img = img.crop(model.crop_x.to_i, model.crop_y.to_i, model.crop_w.to_i, model.crop_h.to_i) 
			end 
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
