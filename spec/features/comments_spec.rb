require 'rails_helper'

RSpec.feature 'Managing comments' do
  scenario 'List all comments associated with an article' do
    article = Article.create!(title: 'Cows', body: 'They go moo')
    another_article = Article.create!(title: 'Cats', body: 'They go meow')
    comment = Comment.create!([
      {body: 'Cows go moo', article: article},
      {body: 'Cats go meow', article: another_article},
      {body: 'Cows go moo', article: article}
    ])

    visit "/articles/#{article.id}/comments"

    expect(page).to have_content 'Comments'
    expect(page).to have_selector 'comment',
      count: 2
  end

  scenario 'Create a comment' do
    article = Article.create!(title: 'Cows', body: 'They go moo')
    visit "/articles/#{article.id}/comments/new"

    fill_in 'Body', with: "Cats don't go moo"
    click_on 'Create Comment'

    expect(page).to have_content(/success/i)
  end

  scenario 'Read a comment' do
    article = Article.create!(title: 'Cows', body: 'They go moo')
    comment = Comment.create!(body: 'Cows go moo', article: article)

    visit "/articles/#{article.id}/comments/#{comment.id}"

    expect(page.find('h1')).to have_content 'Cows'
    expect(page).to have_content 'Cows go moo'
  end

  scenario 'Update an comment' do
    article = Article.create!(title: 'Cows', body: 'They go moo')
    comment = Comment.create!(body: 'Cows go moo', article: article)

    visit "/articles/#{article.id}/comments/#{comment.id}/edit"

    fill_in 'Body', with: 'Cats do go moo'
    click_on 'Update Comment'

    expect(page).to have_content(/success/i)
    expect(page).to have_content 'Cats do go moo'
  end


end

