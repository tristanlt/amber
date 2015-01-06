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
    if @user.present?
      Amber::Application.config.manager.include?(@user.email)
    else
      false
    end
  end
  
  def new?
    if @user.present?
      Amber::Application.config.manager.include?(@user.email)
    else
      false
    end
  end
  
  def create?
    if @user.present?
      Amber::Application.config.manager.include?(@user.email)
    else
      false
    end
  end
  
  def update?
    if @user.present?
      Amber::Application.config.manager.include?(@user.email)
    else
      false
    end
  end
  
  def edit?
    if @user.present?
      Amber::Application.config.manager.include?(@user.email)
    else
      false
    end
  end
  
end