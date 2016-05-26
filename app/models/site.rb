class Site
  include Mongoid::Document

  field :name, type: String
  field :description, type: String
  field :url, type: String
  field :tags, type: Array

  default_scope -> { order_by(name: :asc) }
  scope :tagged, ->(tag) { where(tags: tag) }
end
