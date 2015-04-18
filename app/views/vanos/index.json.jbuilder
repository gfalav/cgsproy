json.array!(@vanos) do |vano|
  json.extract! vano, :id, :nombre, :proyecto_id, :conductor_id, :zona_id, :vano, :hconductor
  json.url vano_url(vano, format: :json)
end
