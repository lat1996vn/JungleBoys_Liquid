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
        @comments = @room.comments.order(id: :desc)
        @comment = Comment.new
        @rating = Rating.new
    end

    def edit
        @room = Room.find(params[:id])
        # if @room.update_attributes(post_params)
        #     redirect_to home_index_path
        # else
        #     render :edit
        # end
    end

    def search
        # @rooms=Room.where('room_name LIKE ?', "%#{params[:room_name]}%").order('id DESC')
        # # @room.show
        @q = Room.ransack(params[:q])
        @rooms = @q.result
    end

    def accept
        @room = Room.find(params[:id])
        @room.update_attributes(:is_approved => 1)
    end
    
    def destroy
        @room = Room.find(params[:id])
        @room.destroy
        flash.notice="Room '#{@room.room_name}' was deleted"
        redirect_to home_index_path
    end
    
    private
    
    def post_params
      params.required(:room).permit(:room_name, :user_id, :room_info, :address, :cost_per_night,
                        :type_of_room, :num_of_bedrooms, :num_of_beds,
                        :num_of_guests, :num_of_baths, :amentities, {pictures: []}, 
                        :contact_host)
    end
    
    def get_params 
      params.permit(:room_name, :address, :cost_per_night,
                        :type_of_room)
    end

end
