class ApplicationUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  include ::CarrierWave::Backgrounder::Delay

  storage :fog

  def store_dir
    "system/uploads/#{model.class.to_s.underscore}"
  end

  def default_url
    "/assets/fallback/#{model.class.to_s.underscore}/pic.png"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def filename
    "#{mounted_as}_#{model.id}.#{file.extension.to_s}" if original_filename.present?
  end
end