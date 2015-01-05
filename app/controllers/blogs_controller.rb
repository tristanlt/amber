class BlogsController < ApplicationController
  def index
    @blogs = Blog.all  
    
    authorize @blogs
    
    respond_to do |format|
      format.html
      format.json { render json: @blogs }
    end
  end
  
  def show
    @blog = Blog.find(params[:blog_id])
    
    authorize @blog
    
    @postsbypage=10
    @allposts=@blog.posts.where({ published: true }).sort(date: -1)
    @nbpages=(@allposts.count/@postsbypage)+1
    if defined? params[:data][:page]
      @page=params[:data][:page]
    else
      @page=1
    end
    
    postsquery=@blog.posts.where({ published: true }).sort(date: -1).limit(@postsbypage.to_i*@page.to_i)
    @posts=[]
    postsquery.to_a[@postsbypage.to_i*(@page.to_i-1)..@postsbypage.to_i*(@page.to_i)-1].each do |p|
      @posts << p
    end
    
    respond_to do |format|
      format.html
      format.json { render json: @blog }
    end
  end

  def new
    @blog = Blog.new

    authorize @blog

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @blog }
    end
  end

  # Get /:blogtextid/:Blogtextid/edit
  def edit
    @blog = Blog.find(params[:blog_id])
    authorize @blog
  end

  # Blog /:blogtextid
  # Blog /:blogtextid.json
  def create
    @blog = Blog.new(blog_params)
     
    authorize @blog
    
    respond_to do |format|
      if @blog.save
        format.html { redirect_to  @blog, notice: 'Blog created' }
        format.json { render json: @blog, status: :created, location: @blog }
      else
        format.html { render action: "new" }
        format.json { render json: @Blog.errors, status: :unprocessable_entity }
      end
    end

    @blog.save
  end

  def update
    @blog = Blog.find(params[:blog_id])
     
    authorize @blog
      
    respond_to do |format|
      if @blog.update_attributes(blog_params)
        format.html { redirect_to( @blog,notice: 'noghint') }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def blog_params
    params.require(:blog).permit(:textid, :title, :description, :published)
  end
  
end