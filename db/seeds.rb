# To load tristan.lt blog content
require 'sqlite3'

myblog = Blog.create!(textid: 'blog', title: 'Another MongoDB Blog Energized by Rails', description: 'My blog', published: true)
myblog.save

myblog.tags.create(word: 'mongodb')
myblog.tags.create(word: 'rails')
myblog.tags.create(word: 'amber')

myblog.tags.create(word: 'bakerie')
myblog.tags.create(word: 'cookies')
myblog.tags.create(word: 'muffins')
myblog.tags.create(word: 'chocolat')
myblog.tags.create(word: 'pie')

billet=myblog.posts.create(title: 'Chocolat Muffins', content: 'Gabuzomeu', textid: 'chocolat-muffins', published: true)
billet.tags << myblog.tags.where({word: 'bakerie'}).first
billet.tags << myblog.tags.where({word: 'muffins'}).first
billet.tags << myblog.tags.where({word: 'chocolat'}).first
billet.save

billet=myblog.posts.create(title: 'Apple pie', content: 'Gabuzomeu', textid: 'apple-pie', published: true)
billet.tags << myblog.tags.where({word: 'bakerie'}).first
billet.tags << myblog.tags.where({word: 'pie'}).first
com = billet.comments.create(content: 'Un commentaire qui va bien', date: DateTime.now, published: true)
com.child_comments.create(content: 'Une réponse au commentaire qui va bien', date: DateTime.now, published: true)
com.child_comments.create(content: 'Une autre réponse au commentaire qui va bien', date: DateTime.now, published: true)
billet.save


billet2=myblog.posts.create(title: 'Billet about Amber Blog', content: 'Gabuzomeu', textid: 'billet-amber-blog', published: true)
billet2.tags << myblog.tags.where({word: 'amber'}).first
billet2.tags << myblog.tags.where({word: 'rails'}).first
billet2.tags << myblog.tags.where({word: 'mongodb'}).first
billet2.save

billet2=myblog.posts.create(title: 'Billet rails', content: 'Gabuzomeu', textid: 'billet-rails', published: true)
billet2.tags << myblog.tags.where({word: 'rails'}).first
billet2.save

billet2=myblog.posts.create(title: 'Billet rails mongodb', content: 'Gabuzomeu', textid: 'billet-rails-mongoid1', published: true)
billet2.tags << myblog.tags.where({word: 'rails'}).first
billet2.tags << myblog.tags.where({word: 'mongodb'}).first
billet2.save

billet2=myblog.posts.create(title: 'Billet rails mongoid 2', content: 'Gabuzomeu', textid: 'billet-rails-mongoid1', published: true)
billet2.tags << myblog.tags.where({word: 'rails'}).first
billet2.tags << myblog.tags.where({word: 'mongodb'}).first
billet2.save

billet2=myblog.posts.create(title: 'Billet rails mongoid 3', content: 'Gabuzomeu', textid: 'billet-rails-mongoid3', published: true)
billet2.tags << myblog.tags.where({word: 'rails'}).first
billet2.tags << myblog.tags.where({word: 'mongodb'}).first
billet2.save


# import de la base blog tristan.lt
db = SQLite3::Database.open "tristanlt-dev.db"
stm = db.prepare "SELECT slug,title,created,content,keywords_string FROM blog_blogpost"
rs = stm.execute 
    
rs.each do |row|
  baffouille=myblog.posts.create(title: row[1], content: row[3], textid: row[0],date: row[2] ,published: true)
  row[4].split.each do |tagword|
    baffouille.tags << myblog.tags.where({word: tagword}).first_or_create!
  end
  baffouille.save
end
    
