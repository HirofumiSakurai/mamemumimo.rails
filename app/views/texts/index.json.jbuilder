json.array!(@texts) do |text|
  json.extract! text, :id, :entity, :parent, :latest
  json.url text_url(text, format: :json)
end
