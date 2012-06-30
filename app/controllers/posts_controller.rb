class PostsController < ApplicationController
  include RespondWithCorrectSlug
  respond_to :html

  expose(:posts) { Post.all }
  expose(:post)

  def index
    respond_with :posts
  end

  def show
    responder_for post
  end

  def new
    respond_with post
  end

  def edit
    respond_with post
  end

  def create
    flash[:success] = "Created" if post.save
    respond_with post
  end

  def update
    flash[:success] = t('updated') if post.update_attributes(params[:post])
    respond_with post
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    flash[:success] = "deleted" if post.destroy
    respond_with post, location: posts_path
  end
end
