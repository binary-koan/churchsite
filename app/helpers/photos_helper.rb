module PhotosHelper
  def gallery_path(gallery_id, **params)
    query_string = "?#{params.to_query}" if params.present?
    "/photos/gallery/#{gallery_id}#{query_string}"
  end
end
