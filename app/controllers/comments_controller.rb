class CommentsController<ApplicationController
  def index
    @article = Article.find(params[:article_id])
    @comments = @article.comments
  end

  def show
    @article = Article.find(params[:article_id])
    @comment = Comment.find(params[:id])
  end

  def new
    @article = Article.find(params[:article_id])
    @comment = Comment.new
  end

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new(comment_params)
      if @comment.save
        flash[:success] = 'Successfully created article!'
        redirect_to article_comments_path(@article)
      else
        render :new
      end
    end

    private

    def comment_params
      params.require(:comment).permit(:body)
    end

end
