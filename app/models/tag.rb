class Tag
  include Mongoid::Document
  field :word, type: String
  has_and_belongs_to_many :posts
  belongs_to :blog
  validates_uniqueness_of :word
end