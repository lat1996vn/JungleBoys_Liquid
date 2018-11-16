class LikesController < ApplicationController
 

  # GET /likes/new
  def new
    @like = Like.new
  end


  # POST /likes
  # POST /likes.json
  def create
    @like = Like.new(post_params)

    respond_to do |format|
      if @like.save
        format.html { redirect_to @comment, notice: 'Like was successfully created.' }
        
      else
        format.html { render :new }
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @like.update(like_params)
        format.html { redirect_to @like, notice: 'Like was successfully updated.' }
        format.js   { }
        format.json { render :show, status: :ok, location: @like }
      else
        format.html { render :edit }
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /likes/1
  # DELETE /likes/1.json
  def destroy
    @like = Like.find(params[:id])
    @like.destroy

  end
  
  def wish_by? user
    wishlists.exists? user_id: user
  end


    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
        params.require(:like).permit(:comment_id, :user_id)
    end
end
