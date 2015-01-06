class Ckeditor::AttachmentFilePolicy
  attr_reader :user, :attachment

  def initialize(user, attachment)
    @user = user
    @attachment = attachment
  end

  def index?
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

  def destroy?
    if @user.present?
        Amber::Application.config.manager.include?(@user.email)
      else
        false
    end
  end
end