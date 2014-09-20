class Blog
  include Mongoid::Document
  field :_id, type: String, default: ->{ textid }
  field :textid, type: String
  field :title, type: String
  field :description, type: String
  field :published, type: Boolean
  has_many :tags
  has_many :posts
  validates_uniqueness_of :textid
end