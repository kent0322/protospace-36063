class PrototypesController < ApplicationController
  def index
    @prototype = Prototype.all
    @prototype = Prototype.includes(:user)
  end
  
  def new
    @prototype = Prototype.new

  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def edit
    @prototype = Prototype.find(params[:id])
    
  end

  def update
    prototype = Prototype.find(params[:id])
    prototype.update(prototype_params)
    if prototype.update(prototype_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @prototype = Prototype.find(params[:id])
     @prototype.destroy 
     if @prototype.destroy
      redirect_to root_path
    else
      render :new
    end
  end



  def create
    #binding.pry
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end

   private

   def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
   end
 end


