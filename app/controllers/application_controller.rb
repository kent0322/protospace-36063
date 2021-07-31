class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?
def search
  @prototypes = SearchPrototypesServicer.search(params[:keyword])
end
  private
  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile, :occupation, :position])

  end
end
