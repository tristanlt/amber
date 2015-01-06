class WelcomeController < ApplicationController

  def index
    case Amber::Application.config.roottype
      when 'blog'
        if Amber::Application.config.rootshortid
          logger.debug(Amber::Application.config.rootshortid)
          blog=Blog.find(Amber::Application.config.rootshortid)
          logger.debug(blog)
          redirect_to blog_path(blog)
        end
    end
    
  end

end