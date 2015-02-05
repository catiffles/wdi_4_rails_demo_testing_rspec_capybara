# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
article = Article.create!(title: 'Cows', body: 'They go moo')
another_article = Article.create!(title: 'Cats', body: 'They go meow')
comment = Comment.create!([
  {body: 'Cows go moo', article: article},
  {body: 'Cats go meow', article: another_article},
  {body: 'Cows go moo', article: article}
])