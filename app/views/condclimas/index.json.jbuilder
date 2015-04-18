json.array!(@condclimas) do |condclima|
  json.extract! condclima, :id, :zona_id, :nombre, :temp, :viento, :hielo
  json.url condclima_url(condclima, format: :json)
end
