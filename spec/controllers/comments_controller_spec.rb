require 'rails_helper'

RSpec.describe CommentsController do
  let(:valid_attributes) {
    { body: 'Cows go moo' }
  }

  let(:invalid_attributes) {
    { body: nil }
  }

  describe 'GET index' do
    it 'has a 200 status code' do
      article = Article.create!(title: 'Cows', body: 'They go moo')
      get :index, article_id: article
      expect(response.status).to eq 200
    end

    it 'renders the index template' do
      article = Article.create!(title: 'Cows', body: 'They go moo')
      get :index, article_id: article
      expect(response).to render_template('index')
    end

    it 'assigns @comments' do
      article = Article.create!(title: 'Cows', body: 'They go moo')
      comments = Comment.all
      get :index, article_id: article
      expect(assigns(:comments)).to eq comments
    end
  end

  describe 'GET new' do
    it 'has a 200 status code' do
      article = Article.create!(title: 'Cows', body: 'They go moo')
      get :new, article_id: article
      expect(response.status).to eq 200
    end

    it 'renders the new template' do
      article = Article.create!(title: 'Cows', body: 'They go moo')
      get :new, article_id: article
      expect(response).to render_template('new')
    end

    it 'assigns @comment' do
      article = Article.create!(title: 'Cows', body: 'They go moo')
      get :new, article_id: article
      expect(assigns(:comment)).to be_a_new Comment
    end
  end

  describe 'GET show' do
    it 'has a 200 status code' do
      article = Article.create!(title: 'Cows', body: 'They go moo')
      comment = Comment.create!(valid_attributes)
      get :show, article_id: article, id: comment
      expect(response.status).to eq 200
    end

    it 'renders the show template' do
      article = Article.create!(title: 'Cows', body: 'They go moo')
      comment = Comment.create!(valid_attributes)
      get :show, article_id: article, id: comment
      expect(response).to render_template('show')
    end

    it 'assigns @comment' do
      article = Article.create!(title: 'Cows', body: 'They go moo')
      comment = Comment.create!(body: 'Cats go moo', article_id: article)
      get :show, article_id: article, id: comment
      expect(assigns(:comment)).to eq comment
    end
  end
  
end
