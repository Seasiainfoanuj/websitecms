# encoding: utf-8
class RedactorRailsDocumentUploader < CarrierWave::Uploader::Base
  include RedactorRails::Backend::CarrierWave

  # storage :fog
  storage :file

  def store_dir
    "media/documents/#{Time.now.year}/#{Time.now.month}/#{Time.now.day}"
  end

  def extension_white_list
    RedactorRails.document_file_types
  end
end
