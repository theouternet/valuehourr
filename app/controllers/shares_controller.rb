class SharesController < ApplicationController

  before_action :logged_in?, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

    # before_action :require_login

    def index
      if params[:location_id]
        @shares = Location.find(params[:location_id]).shares
      else 
        @shares = Share.all
    end
  end 
  
    def show
        @share = Share.find(params[:id])

        respond_to do |format|
          format.html { render :show }
          format.json { render json:  @share }
        end 
    end
  
    def new
        @share = Share.new(:user_id => current_user.id)
        @share.location_id = params[:location_id]
       end
  
       def create
       @share = Share.new(share_params)
       if @share.save
            redirect_to share_path(@share)
       else 
          render :new
       end 
        end
  
    def edit
      @share = Share.find_by(id: params[:share_id])
      
      if @share.user_id != current_user.id
        redirect_to shares_path
      end
    end
  
    def update
      @share.update(share_params)
  
    #  redirect_to ..._path(
    end
  
  private
  
    def share_params
      params.require(:share).permit(:user_id, :location_id, :drink_name, :drink_type, :drink_sub_type, :size, :price, :when_available, :menu_link)
    end

    def correct_user
      @share = current_user.shares.find_by(id: params[:id])
      redirect_to root_url if @share.nil?
    end
  

end
