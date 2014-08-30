class Post
	include Mongoid::Document
	field :title, type: String
  	field :content, type: String
  	field :textid, type: String
  	field :date, type: DateTime
  	field :published, type: Boolean
	field :tags, type: String
end
