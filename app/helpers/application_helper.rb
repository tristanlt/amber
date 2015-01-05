module ApplicationHelper
    def title(page_title)
      content_for(:title) { Amber::Application.config.shorttitle.to_s+" | "+page_title.to_s }
    end
    def tagtool(blog)
      @tags = blog.tags.all

      # Put into relatedtags array all tags object referenced by relatedwords params 
      #relatedtags =[]
      #blog.tags.in(word: params[:relatedwords]).each {|t| relatedtags << t}

      
      #heatmax=0
      #heatmin=999999  
      postsmax=0
      postsmin=999999
      
      @out=[]
      @tags.each do |t|
        if t['word'].present?
          # TODO : transform this in map-reduce job
          # Start searching related tags
          score=0
          #t.posts.each do |p|
          #  relatedtags.each do |rt|
          #    logger.debug(p.tag_ids)
          #    if p.tag_ids.include?(BSON::ObjectId.from_string(rt._id))
          #       score=score+1
          #    end
          #  end
          #end
          if t.posts.size > postsmax
            postsmax=t.posts.size
          end
          if t.posts.size < postsmin
            postsmin=t.posts.size
          end
          #if score < heatmin
          #  heatmin=score
          #end
          #if score > heatmax
          #  heatmax=score
          #end
          @out << {id: t['_id'], word: t['word'], posts: t.posts.size, level: 0, heat: score}
        end
      end

      steplevel=(postsmax-postsmin)/5
      if steplevel < 1
        steplevel=1
      end 
      
      logger.debug(steplevel)
      @out.each do |s|
        logger.debug((s['posts'].to_i-postsmin)/steplevel)
        s[:level]=(s[:posts].to_i-postsmin)/steplevel
        s[:heat]=(s[:posts].to_i-postsmin)/steplevel
        logger.debug(s[:word])
        logger.debug(s[:heat])
        logger.debug(s[:level])
      end
     
      return @out
    end
end
