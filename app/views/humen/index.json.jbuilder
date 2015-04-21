json.array!(@humen) do |human|
  json.extract! human, :id, :name, :occupation, :email, :knowledge, :social, :news, :phoneos
  json.url human_url(human, format: :json)
end
