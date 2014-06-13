json.array!(@mains) do |main|
  json.extract! main, :id, :name, :tel, :address
  json.url main_url(main, format: :json)
end
