class UploadsController < ApplicationController
  def attachment
    @attachment = Attachment.find params[:id]
    last_modified = @attachment.updated_at ? @attachment.updated_at.utc : DateTime.now
    send_file @attachment.attachment, last_modified
  end

  def church_image
    @church = Church.find params[:id]
    last_modified = @church.updated_at ? @church.updated_at.utc : DateTime.now
    send_file @church.image, last_modified
  end

  def leader_image
    last_modified = Option.instance.updated_at ? Option.instance.updated_at.utc : DateTime.now
    send_file Option.instance.leader_image, last_modified
  end

  def photo_image
    @photo = Photo.find params[:id]
    last_modified = @photo.updated_at ? @photo.updated_at.utc : DateTime.now
    send_file @photo.image, last_modified
  end

  def photo_thumb
    @photo = Photo.find params[:id]
    last_modified = @photo.updated_at ? @photo.updated_at.utc : DateTime.now
    send_file @photo.image.thumb, last_modified
  end

  def ckeditor_picture
    @picture = Ckeditor::Picture.find params[:id]
    last_modified = @picture.updated_at ? @picture.updated_at.utc : DateTime.now
    send_file @picture.data, last_modified
  end

  def ckeditor_picture_content
    @picture = Ckeditor::Picture.find params[:id]
    last_modified = @picture.updated_at ? @picture.updated_at.utc : DateTime.now
    send_file @picture.data.content, last_modified
  end

  def ckeditor_picture_thumb
    @picture = Ckeditor::Picture.find params[:id]
    last_modified = @picture.updated_at ? @picture.updated_at.utc : DateTime.now
    send_file @picture.data.thumb, last_modified
  end

  private

    def send_file(uploader, last_modified)
      content = uploader.read
      if stale?(etag: content, last_modified: last_modified, public: true)
        send_data content, type: uploader.file.content_type, disposition: "inline"
        expires_in 0, public: true
      end
    end
end
