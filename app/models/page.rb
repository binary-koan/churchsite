class Page
  include Mongoid::Document

  TYPES = %w{custom homepage news photos sermons}

  field :title, type: String
  field :content, type: String
  field :identifier, type: String
  field :order, type: Integer, default: 0
  field :type, type: String

  validates :type, inclusion: { in: TYPES }

  before_save do |document|
    document.identifier = document.title.parameterize
  end

  TYPES.each do |type|
    scope type, -> { where(type: type) }
    define_method(type + "?") { self.type == type }
  end

  def url_path
    if homepage?
      "/"
    else
      "/#{identifier}"
    end
  end
end
