#namespace :import do
  desc "Import postcode from csv file into province, city, county tables"
  task csv_import: :environment do
    lines = File.new('db/cn_postcode.csv').readlines
    header = lines.shift.strip
    last_province,last_city = '',''
    province_id, city_id = 0,0
    
    lines.each do |line|
      province,city,county,phone_code,zip_code = line.split(',')

      if last_province != province
        province_id += 1
        #city_id = 0 #lead to table cities id to differ from counties city_id
        Province.create!(name:province)
        
        last_province = province
      end

      if last_city != city 
        city_id = city_id + 1
        City.create!(name:city, province_id: province_id)
        last_city = city
      end
        
      County.create!( province_id:province_id, city_id:city_id, name:county, phonecode:phone_code, zipcode:zip_code )
    end
  end
  
 
  
  #end
