class CountiesController < ApplicationController
  def show
    @counties = County.where(city_id: params[:city_id]).map {|county| [county.name, county.id] }
    respond_to do |format|
      format.json { render :json => @counties }
    end
  end
end
