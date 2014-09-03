class TagsController < ApplicationController
  def index
    # Index list tags with totals of posts and blogs occurances
    @tags = Tag.all  
    
    out=[]
    @tags.each do |t|
      out << {word: t['word'], posts: t.posts.size, blogs: t.blogs.size}
    end

    respond_to do |format|
      format.json { render json: out }
    end
  end
  
  def show
    @tag = Tag.where(word: params[:word]).first
    @blog = Blog.where(textid: params[:blogtextid]).first
    logger.debug(@blog.title)
    @posts = @tag.posts.where(:blog_id => @blog.id)
    
    respond_to do |format|
      format.html
      format.json { render json: @posts }
    end
  end
  
def create
    # Tag creation do not have a distincts view but just a _partial and a javascript adder
    # $.post('http://localhost:3000/category/create', {word: 'tag13').done(function (data) { alert(data.msg.toString()); });
    @tag = Tag.create(word: params[:word])            
    respond_to do |format|
      if @tag.save
        msg = { 'msg' => 'created' }
        format.json { render json: msg }
      else
        msg = { 'msg' => @tag.errors.full_messages }
        format.json { render json: msg }
      end
    end
end

  
  
end