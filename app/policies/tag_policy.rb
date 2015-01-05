class TagPolicy
  attr_reader :user, :tag

  def initialize(user, tag)
    @user = user
    @tag = tag
  end

  def show?
    true
  end
  
  def index?
    true
  end
  
  def tagtool?
    true
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