json.array!(@members) do |member|
  json.extract! member, :id, :name, :month, :email, :address
  json.url member_url(member, format: :json)
end
