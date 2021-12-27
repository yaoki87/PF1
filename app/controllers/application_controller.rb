class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def render_404
    render :template => '/shared/error_404', status: 404, layout: 'application', content_type: 'text/html'
  end

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password, :remember_me])
  end
end
