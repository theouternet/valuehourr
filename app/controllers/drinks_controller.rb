class DrinksController < ApplicationController

        # before_action :require_login
    
        def index
            @drinks = Drink.all
        end
      
        def show
            @drink = Drink.find_by_id(params[:id])
        end
      
        def new
            @drink = Drink.new
        end
      
        def create
            @drink = Drink.new(location_params)
            if @drink.save
                redirect_to location_path(@drink)
              else
                render :new
              end
            end
      
        def edit
          @drink = Drink.find_by(id: params[:drink_id])
          
          if @drink.user_id != current_user.id
            redirect_to drink_path
          end
        end
      
        def update
          @drink.update(drink_params)
      
        #  redirect_to ..._path(
        end
      
      private
      
        #def drink_params
        #  params.require(:drink).permit(:
        #end
    
end
