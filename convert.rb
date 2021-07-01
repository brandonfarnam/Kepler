require 'csv'
require 'json'
require 'time'

data = {
  fields: [
    {name: 'id', format: '', type: 'int'},
    {name: 'timestamp', format: 'm/d/yy h:mm', type: 'timestamp'},
    {name: 'merchant_name', format: '', type: 'string'},
    {name: 'lat', format: '', type: 'real'},
    {name: 'lon', format: '', type: 'real'}
  ],
  rows: []
}

CSV.foreach("procurement_orders_lat_lon.csv", {headers: true}) do |row|
  data[:rows] << [
    row["id"].to_i,
    row["timestamp"].to_s,
    row["merchant_name"].to_s,
    row["lat"].to_f,
    row["lon"].to_f
    ]
end

File.open("procurement_orders_lat_lon_a.json", "w") do |file|
  file.puts data.to_json
end