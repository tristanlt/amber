# To load tristan.lt blog content
require 'sqlite3'

myblog = Blog.create(textid: 'blog', title: 'Another MongoDB Blog Energized by Rails', description: 'My blog', published: true)

Tag.create(word: 'mongodb')
Tag.create(word: 'rails')
Tag.create(word: 'test')

myblog.tags << Tag.where(word: 'mongodb')
myblog.tags << Tag.where(word: 'rails')

billet=myblog.posts.create(title: 'Billet de test', content: 'Gabuzomeu', textid: 'billet-de-test', published: true)

com = billet.comments.create(content: 'Un commentaire qui va bien', date: DateTime.now, published: true)
com.child_comments.create(content: 'Une réponse au commentaire qui va bien', date: DateTime.now, published: true)
com.child_comments.create(content: 'Une autre réponse au commentaire qui va bien', date: DateTime.now, published: true)

billet2=myblog.posts.create(title: 'Billet de test numéro 2', content: 'Gabuzomeu', textid: 'billet-de-test2', published: true)
billet2.tags << Tag.where(word: 'test')

billet3=myblog.posts.create(title: 'Billet de test numéro 3', content: 'Gabuzomeu3', textid: 'billet-de-test3', published: true)
billet3.tags << Tag.where(word: 'test')


# import de la base blog tristan.lt
db = SQLite3::Database.open "tristanlt-dev.db"
stm = db.prepare "SELECT slug,title,created,content FROM blog_blogpost"
rs = stm.execute 
    
rs.each do |row|
  baffouille=myblog.posts.create(title: row[1], content: row[3], textid: row[0],date: row[2] ,published: true)
  print(row[2])
end
    
