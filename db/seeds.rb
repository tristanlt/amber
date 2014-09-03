# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

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
