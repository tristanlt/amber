class SitemapController < ApplicationController
  def index
    @blogs = Blog.where(published: true)
    @posts = Post.where(published: true)  

    respond_to do |format|
      format.xml
    end
  end
end