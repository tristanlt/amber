class RegistrationsController < Devise::RegistrationsController
  def new
    unless Amber::Application.config.autosubscribe
      flash[:info] = 'Registrations are not open.'
      redirect_to root_path
    end
  end

  def create
    unless Amber::Application.config.autosubscribe
      flash[:info] = 'Registrations are not open.'
      redirect_to root_path
    end
  end
end