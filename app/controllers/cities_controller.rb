class CitiesController < ApplicationController
  def show
    @cities = City.where(province_id: params[:province_id]).map {|city| [city.name, city.id] }
    respond_to do |format|
      format.json { render :json => @cities }
    end
  end
  
end
