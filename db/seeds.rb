json = ActiveSupport::JSON.decode(File.read('db/restaurants.json'))

json.each do |data|
    Restaurant.create!(data)
end
