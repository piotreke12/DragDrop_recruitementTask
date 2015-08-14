Spot.delete_all
begin
   Spot.create(position_x: Faker::Number.between(100, 900), position_y: Faker::Number.between(100, 900), name: "Spot "+(Spot.maximum(:id).to_i + 1).to_s )
end while Spot.all.length < 5