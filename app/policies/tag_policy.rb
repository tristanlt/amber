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