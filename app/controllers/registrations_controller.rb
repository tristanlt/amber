class RegistrationsController < Devise::RegistrationsController
  def new
    super
    unless Amber::Application.config.autosubscribe
      flash[:info] = 'Registrations are not open.'
      redirect_to root_path
    end
  end

  def create
    super
    unless Amber::Application.config.autosubscribe
      flash[:info] = 'Registrations are not open.'
      redirect_to root_path
    end
  end
end