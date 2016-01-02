json.array!(@seasons) do |season|
  json.extract! season, :id, :name, :beginning_date, :ending_date
  json.url season_url(season, format: :json)
end
