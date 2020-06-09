class SessionsController < ApplicationController

    def new
        @user = User.new
      end

      def create
        if auth
          @user = User.find_or_create_by(omniauth_uid: auth['uid']) do |u|
            u.username = auth['info']['name']
            u.omniauth_provider = auth['provider']
            u.password = u.password_confirmation = SecureRandom.urlsafe_base64(n=6)
          end 
          else
            @user = User.find_by(username: params[:user][:username])

            if @user && @user.authenticate(params[:user][:password])
              log_in(@user)
      
              redirect_to user_path(@user)              
          session[:user_id] = @user.id
          redirect_to root_path
        end
      end
    end 



def destroy
    session.delete :user_id
    redirect_to root_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end

end