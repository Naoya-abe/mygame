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

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :age])
    end
  
  
  
  
  
end
