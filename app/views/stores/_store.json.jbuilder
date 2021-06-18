json.extract! store, :id, :name, :color, :description, :weight, :price, :created_at, :updated_at
json.url store_url(store, format: :json)
