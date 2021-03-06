class PostsController < ApplicationController
  include Sortable
  include Finder
  include Authorization
  respond_to :html

  expose(:posts) { Post.all }
  expose(:post)

  def index

  end

  def show

  end

  def new

  end

  def edit

  end

  def create
    flash.notice = "Created" if post.save
    respond_with post
  end

  def update
    flash.notice = t('updated') if post.save
    respond_with post
  end

  def destroy
    flash.notice = "deleted" if post.destroy
    respond_with post, location: posts_path
  end
end
