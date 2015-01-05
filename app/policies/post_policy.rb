class PostPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def show?
    (@post.published? or Amber::Application.config.manager.include?(@user.email)) and @post.blog.published?
  end
  
  def index?
    Amber::Application.config.manager.include?(@user.email)
  end
  
  def new?
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