class RoomsController < ApplicationController
    def index
        # if current_user.is_admin
        # end
    end
    
    def new
       @room = Room.new 
    end
    
    def create
        @room = Room.new(post_params)
        if @room.save
            redirect_to home_index_path
        else
            render :new
        end
    end
    
    def show
        @room = Room.find(params[:id])
    end
    
    def edit
        @room = Room.find(params[:id])
        # if @room.update_attributes(post_params)
        #     redirect_to home_index_path
        # else
        #     render :edit
        # end
    end
    
    private
    
    def post_params
      params.require(:room).permit(:room_name, :user_id, :address, :cost_per_night,
                        :type_of_room, :num_of_bedrooms, :num_of_beds,
                        :num_of_guests, :num_of_baths, :amentities, {pictures: []}, 
                        :contact_host)
    end
   
end
