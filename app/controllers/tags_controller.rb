class TagsController < ApplicationController
  
  def index
    authorize Tag
  end
  
  def show
    @blog = Blog.find(params[:blog_id])
    @tag = @blog.tags.where({word:params[:word]}).first

    authorize @tag

    @allposts = @tag.posts.where({ published: true })

    @postsbypage=10
    @nbpages=(@allposts.count/@postsbypage)+1
    if defined? params[:data][:page]
      @page=params[:data][:page]
    else
      @page=1
    end
    postsquery=@allposts.where({ published: true }).sort(date: -1).limit(@postsbypage.to_i*@page.to_i)
    @posts=[]
    postsquery.to_a[@postsbypage.to_i*(@page.to_i-1)..@postsbypage.to_i*(@page.to_i)-1].each do |p|
      @posts << p
    end
    
    respond_to do |format|
      format.html
      format.json { render json: @posts }
    end
  end

def create
    # Tag creation do not have a distincts view but just a _partial and a javascript adder
    # $.post('http://localhost:3000/blogid/tags/create', {word: 'tag13').done(function (data) { alert(data.msg.toString()); });
    blog = Blog.find(params[:blog_id])
    @tag = blog.tags.create(word: params[:word])
    
    authorize @tag
        
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

def update
    # Tag update should use oid in place of word 
    # $.post('http://localhost:3000/blog/tags/gwinGdfs', {newword: 'gwinGd fs'});
    blog = Blog.find(params[:blog_id])
    @tag = blog.tags.where({word: params[:word]}).first
    
    authorize @tag
    
    respond_to do |format|
      if @tag.update_attributes({word: params[:newword]})
        logger.debug(@tag.word)
        msg = { 'msg' => 'updated' }
        format.json { render json: msg }
      else
        @tag.save
        msg = { 'msg' => @tag.errors.full_messages }
        format.json { render json: msg }
      end
    end
end

def destroy
    # Tag destroy should use oid in place of word 
    # $.post('http://localhost:3000/blog/tags/gwinGdfs/destroy');
    blog = Blog.find(params[:blog_id])
    @tag = blog.tags.where({word: params[:word]}).first
    
    authorize @tag
    
    respond_to do |format|
      if @tag.destroy
        msg = { 'msg' => 'destroyed' }
        format.json { render json: msg }
      else
        msg = { 'msg' => @tag.errors.full_messages }
        format.json { render json: msg }
      end
    end
end

def tagtool
  # Index list tags with totals of posts and blogs occurances
    blog = Blog.find(params[:blog_id])
    @tags = blog.tags.all

    authorize @tags

    # Retrieve tags id by theses words from relatedwords POST params
    relatedtags =[]
    blog.tags.in(word: params[:relatedwords]).each {|t| relatedtags << t}
    
    @out=[]
    @tags.each do |t|
      score=0
      t.posts.each do |p|
        relatedtags.each do |rt|
          if p.tag_ids.include?(BSON::ObjectId.from_string(rt._id))
             score=score+1
          end
        end
      end
      @out << {id: t['_id'], word: t['word'], posts: t.posts.size, heat: score}
    end

    respond_to do |format|
      format.html
      format.json { render json: @out }
    end
end


end