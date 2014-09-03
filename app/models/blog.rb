class Blog
  include Mongoid::Document
  field :textid, type: String
  field :title, type: String
  field :description, type: String
  field :published, type: Boolean
  has_and_belongs_to_many :tags
  has_many :posts
end