class PostPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def show?
    if @post.published? and @post.blog.published?
      true
    else
      if @user.present?
        Amber::Application.config.manager.include?(@user.email)
      else
        false
      end
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
  
  def destroy?
    if @user.present?
      Amber::Application.config.manager.include?(@user.email)
    else
      false
    end
  end

end