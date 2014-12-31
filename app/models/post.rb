class Post
	include Mongoid::Document
	field :_id, type: String, default: ->{ textid }
	field :title, type: String
  field :content, type: String
  field :textid, type: String
  field :date, type: DateTime, default: ->{ Date.today }
  field :published, type: Boolean
	embeds_many :comments
	has_and_belongs_to_many :tags
	belongs_to :blog
  before_validation :generate_textid
	validates_uniqueness_of :textid

	
	def generate_textid
	  require "i18n"
    unless self.textid?
      textid=I18n.transliterate(self.title).downcase.tr(' ','-').tr('^a-z0-9-', '').gsub(/^-/,'').gsub(/-*$/,'')
      self._id=textid
      self.textid=textid
    end
  end
  
end
