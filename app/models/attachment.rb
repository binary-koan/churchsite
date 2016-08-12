class Attachment
  include Mongoid::Document
  include Mongoid::Timestamps::Updated

  belongs_to :page

  mount_uploader :attachment, AttachmentUploader

  delegate :file, :path, to: :attachment

  def filename
    attachment.path.split("/").last if attachment.path
  end
end
