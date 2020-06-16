class LocationsController < ApplicationController

    # before_action :require_login

    def index
        @locations = Location.all

        respond_to do |format|
          format.html { render :index }
          format.json { render json: @locations, status: 200 }
        end 

    end
    
  
    def show
        @location = Location.find(params[:id])

        respond_to do |format|
          format.html { render :show }
          format.json { render json: @location, status: 200 }
        end 
      end
  
    def new
        @location = Location.new
    end
  
    def create
        @location = Location.new(location_params)
        if @location.save
          respond_to do |format| 
            format.html {redirect_to locations_path}
            format.json {render json: @location, status: 200}
        end
      else 
        render 'new'
      end 
    end  
  
    def edit
      @location = Location.find(params[:id])

    end
  
    def update
      @location = Location.find(params[:id])
  
      if @location.update(location_params)
        redirect_to @location
      else
        render 'edit'
      end    
    end
  
  private
  
    def location_params
      params.require(:location).permit(:name, :zip, :menu_link)
    end

end
