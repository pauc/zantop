class PostsController < ApplicationController
  include Sortable
  respond_to :html

  expose(:posts) { Post.all }
  expose(:post)

  before_filter :find_post, only: [:show]

  def index

  end

  def show

  end

  def new

  end

  def edit

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
