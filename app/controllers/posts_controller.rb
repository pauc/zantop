class PostsController < ApplicationController
  include Sortable::SimpleSort
  respond_to :html

  expose(:posts) { Post.all }
  expose(:post)

  before_filter :find_post, only: [:show]

  def index
    respond_with posts
  end

  def show
    respond_with post
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
    flash[:success] = t('updated') if post.save
    respond_with post
  end

  def destroy
    flash[:success] = "deleted" if post.destroy
    respond_with post, location: posts_path
  end

  private

    def find_post
      post = Post.find params[:id]

      if request.path != post_path(post)
        return redirect_to post, :status => :moved_permanently
      end
    end
end
