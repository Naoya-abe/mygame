class ApplicationController < ActionController::Base
   
   before_action :configure_permitted_parameters, if: :devise_controller?

  private
  
  def read(result)
    jancode = result['jan']
    title = result['title']
    url = result['itemUrl']
    image_url = result['largeImageUrl']
    {
      jancode: jancode,
      title: title,
      url: url,
      image_url: image_url,
    }
  end


  protected

    # def configure_permitted_parameters
    #   devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :age])
    # end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password,
      :password_confirmation, :remember_me, :image, :image_cache, :remove_image) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password,
      :password_confirmation, :current_password, :image, :image_cache, :remove_image) }
  end
  
  
  
end
