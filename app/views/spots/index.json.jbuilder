json.array!(@spots) do |spot|
  json.extract! spot, :id, :x, :y
  json.url spot_url(spot, format: :json)
end
