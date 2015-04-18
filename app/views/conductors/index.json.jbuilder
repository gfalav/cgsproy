json.array!(@conductors) do |conductor|
  json.extract! conductor, :id, :nombre, :diametro, :seccion, :peso, :rmec, :coef_e, :coef_t, :imax, :relec, :tmax, :tmed
  json.url conductor_url(conductor, format: :json)
end
