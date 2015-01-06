class PostsController < ApplicationController
  def index
    logger.debug(params)
    # Index list posts
    @blog = Blog.find(params[:blog_id])
    @posts = @blog.posts
    
    authorize @posts
    
    respond_to do |format|
      format.html
      format.json { render json: @posts }
    end
  end
  
  def show
    @blog = Blog.find(params[:blog_id])  
    @post = @blog.posts.find(params[:post_id])
    
    authorize @post
    
    respond_to do |format|
      format.html
      format.json { render json: @post }
    end
  end

  # Get /:blogtextid/new
  def new
    @blog = Blog.find(params[:blog_id])
    @post = @blog.posts.new
    
    authorize @post
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # Get /:blogtextid/:posttextid/edit
  def edit
    @blog = Blog.find(params[:blog_id])
    @post = @blog.posts.find(params[:post_id])

    authorize @post

  end

  # POST /:blogtextid
  # POST /:blogtextid.json
  def create
    @blog = Blog.find(params[:blog_id])
    @post = @blog.posts.new(post_params)
    
    authorize @post
    
    respond_to do |format|
      if @post.save
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
    @blog = Blog.find(params[:blog_id])
    @post = @blog.posts.find(params[:post_id])
    
    authorize @post
    
    respond_to do |format|
      if @post.update_attributes(post_params)
        format.html { redirect_to( blog_post_path(@blog, @post) ,notice: 'Post was modified') }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    blog = Blog.find(params[:blog_id])
    post = blog.posts.find(params[:post_id])
    authorize post
    post.destroy
    redirect_to( blog_path(blog) ,notice: 'Post deleted')
  end

  private
  def post_params
    params.require(:post).permit(:textid, :title, :content, :date, :published)
  end
  
end