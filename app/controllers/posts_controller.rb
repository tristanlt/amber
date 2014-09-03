class PostsController < ApplicationController
  def index
    # Index list posts
    @posts = Post.all  
    
    respond_to do |format|
      format.html
      format.json { render json: posts }
    end
  end
  
  def show
    # Show /:blogtextid/:posttextid
    @blog = Blog.where(textid: params[:blogtextid]).first
    @post = @blog.posts.where(textid: params[:posttextid]).first
    
    respond_to do |format|
      format.html
      format.json { render json: @post }
    end
  end
  
end