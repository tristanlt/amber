class PostPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def show?
    if @user.present?
      Amber::Application.config.manager.include?(@user.email)
    else
      @blog.published? and @post.blog.published?
    end
  end
  
  def index?
    Amber::Application.config.manager.include?(@user.email)
  end
  
  def new?
    Amber::Application.config.manager.include?(@user.email)
  end
  
  def create?
    Amber::Application.config.manager.include?(@user.email)
  end
  
  def update?
    Amber::Application.config.manager.include?(@user.email)
  end
  
  def edit?
    Amber::Application.config.manager.include?(@user.email)
  end
  
  def destroy?
    Amber::Application.config.manager.include?(@user.email)
  end

end