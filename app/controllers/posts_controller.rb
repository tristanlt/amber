class PostsController < ApplicationController
  def index
    logger.debug(params)
    # Index list posts
    @posts = Post.all  
    
    respond_to do |format|
      format.html
      format.json { render json: @posts }
    end
  end
  
  def show
    logger.debug(params)
    # Show /:blogtextid/:posttextid
    @blog = Blog.find(params[:blog_id])
    @post = @blog.posts.find(params[:post_id])
    
    respond_to do |format|
      format.html
      format.json { render json: @post }
    end
  end

  # Get /:blogtextid/new
  def new
    logger.debug(params)
    @blog = Blog.find(params[:blog_id])
    @post = @blog.posts.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # Get /:blogtextid/:posttextid/edit
  def edit
    logger.debug(params)
    @blog = Blog.find(params[:blog_id])
    @post = @blog.posts.find(params[:post_id])
  end

  # POST /:blogtextid
  # POST /:blogtextid.json
  def create
    logger.debug(params)
    @blog = Blog.find(params[:blog_id])
    @post = @blog.posts.new(post_params)
        
    respond_to do |format|
      if @post.save
        logger.debug(@post.id)
        format.html { redirect_to  blog_post_path(@blog, @post), notice: 'Post created' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end

    @post.save
  end

  # PUT /:blogtextid/:posttextid
  # PUT /:blogtextid/:posttextid.json
  def update
    logger.debug(params)    
    @blog = Blog.find(params[:blog_id])
    @post = @blog.posts.find(params[:post_id])
    
    respond_to do |format|
      if @post.update_attributes(post_params)
        format.html { redirect_to( blog_post_path(@blog, @post) ,notice: 'noghint') }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def post_params
    params.require(:post).permit(:textid, :title, :content, :date, :published)
  end
  
end