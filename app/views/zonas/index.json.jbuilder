json.array!(@zonas) do |zona|
  json.extract! zona, :id, :nombre
  json.url zona_url(zona, format: :json)
end
