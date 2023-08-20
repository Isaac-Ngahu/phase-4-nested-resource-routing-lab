class ItemsController < ApplicationController

  def index
    if params[:user_id]
      user= User.find(params[:user_id])
      items = user.items
    else 
      items = Item.all
    end
    render json: items,except: [:created_at,:updated_at]
  end
  def show
    item = Item.find(params[:id])
    render json: item,except: [:created_at,:updated_at]
  end
  def create
    if params[:user_id]
      user = User.find(params[:user_id])
      item = user.items.create(item_params)
    else
      item = Item.create(params)
    end
    
    render json: item,status: :created
  end

  private
  def item_params
    params.permit(:name,:description,:price,:user_id)
  end

end
