class Post
	include Mongoid::Document
	field :title, type: String
  field :content, type: String
  field :textid, type: String
  field :date, type: DateTime
  field :published, type: Boolean
	embeds_many :comments
	has_and_belongs_to_many :tags
	belongs_to :blog
end
