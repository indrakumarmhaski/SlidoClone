json.extract! event, :id, :name, :join_code, :created_at, :updated_at
json.url event_url(event, format: :json)
