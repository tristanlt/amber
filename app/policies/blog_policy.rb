class BlogPolicy
  attr_reader :user, :blog

  def initialize(user, blog)
    @user = user
    @blog = blog
  end

  def show?
    if @user.present?
      Amber::Application.config.manager.include?(@user.email)
    else
      @blog.published?
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
  
end