class SweetsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]

    def index
      @sweets = Sweet.all
      # @sweets = @sweets.page(params[:page]).per(3)
    


      # if params[:search] == nil
      #   @sweets= Sweet.all
      # elsif params[:search] == ''
      #   @sweets= Sweet.all
      # else
      #   #部分検索
      #   @sweets = Sweet.where("cook LIKE ? OR name LIKE ?", "%#{search}%", "%#{search}%")
      # end

      if params[:search].present?
      
        @sweets = @sweets.page(params[:page]).per(3).where("cook LIKE ? OR name LIKE ? OR about LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%","%#{params[:search]}%")
      else
      
        @sweets = @sweets.page(params[:page]).per(3).all
      end
    end
  
    def top
    end

    def new
        @sweet = Sweet.new
    end
    
    def create
        sweets = Sweet.new(sweets_params)

        sweets.user_id = current_user.id

      if sweets.save!
        redirect_to :action => "index"
      else
        redirect_to :action => "new"
      end
    end

    def show
      @sweet = Sweet.find(params[:id])
      @comments = @sweet.comments
      @comment = Comment.new
    end

    def edit
      @sweet = Sweet.find(params[:id])
    end

    def update
      sweet = Sweet.find(params[:id])
      if sweet.update(sweets_params)
        redirect_to :action => "show", :id => sweet.id
      else
        redirect_to :action => "new"
      end
    end

    def destroy
      sweet = Sweet.find(params[:id])
      sweet.destroy
      redirect_to action: :index
    end
    
    private
    def sweets_params
      params.require(:sweet).permit(:name, :about, :cook,:image)
    end

  end
