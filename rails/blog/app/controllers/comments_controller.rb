class CommentsController < ApplicationController
  respond_to :html, :js, :json
  def index
    @post = Post.includes(:comments).find params[:post_id]
    render json: @post.comments
  end

  def show

  end

  def new
    @post = Post.find params[:post_id]
    @comment = Comment.new
  end

  def create
    @post = Post.find params[:post_id]
    safe_params = params.require('comment').permit(:content)
    @comment = Comment.new safe_params.merge(post_id: params[:post_id])
    if @comment.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def destroy

  end
end
