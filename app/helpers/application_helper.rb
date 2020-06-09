module ApplicationHelper

  def logged_in?
    !!session[:user_id]
  end

  def require_login
    redirect_to root_path unless logged_in?
  end


  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end


    def current_user_path
        if session[:user_id]
          user_path(session[:user_id])
        else
          root_path
        end
      end
    
      def login_with_google
       link_to image_tag('home/google_signin.png'), '/auth/google'
      end

end
