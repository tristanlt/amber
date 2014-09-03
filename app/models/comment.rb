class Comment
  include Mongoid::Document
  field :author, type: String
  field :content, type: String
  field :date, type: DateTime
  field :published, type: Boolean
  embedded_in :post
  recursively_embeds_many
end