class OrdersController < ApplicationController
  before_action :authenticate_user!

  def new
    @order = Order.build( user_id:current_user.id, restaurant_id:params[:restaurant_id] )
    
   params[:orders_num].times do
      @order_specs << OrderSpecifications.build()
   end
      
  end


  private


    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params[:restaurant_id, :orders_num,
         :orders[:recipe_id, :recipe_name]]
    end
end
