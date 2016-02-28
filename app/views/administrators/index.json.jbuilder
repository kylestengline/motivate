json.array!(@administrators) do |administrator|
  json.extract! administrator, :id, :email
  json.url administrator_url(administrator, format: :json)
end
