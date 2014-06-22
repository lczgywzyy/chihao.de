module RestaurantsHelper
  def provinces
    Province.all.map{ |province| [province.name, province.id] }
  end
  
  
end
