class Blog
  include Mongoid::Document
  field :_id, type: String, default: ->{ textid }
  field :textid, type: String
  field :title, type: String
  field :description, type: String
  field :published, type: Boolean
  has_many :tags
  has_many :posts
  before_validation :generate_textid
  validates_uniqueness_of :textid
  
  def generate_textid
    require "i18n"
    unless self._id?
      textid=I18n.transliterate(self.title).downcase.tr(' ','-').tr('^a-z0-9-', '').gsub(/^-/,'').gsub(/-*$/,'')
      self._id=textid
      self.textid=textid
    end
  end
  
end