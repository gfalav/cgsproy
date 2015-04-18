json.array!(@calcconds) do |calccond|
  json.extract! calccond, :id, :vano_id, :condclima_id, :temp, :viento, :hielo, :tension, :tiro, :flecha_t, :flecha_v, :flecha_h
  json.url calccond_url(calccond, format: :json)
end
