json.extract! room, :id, :description, :created_at, :updated_at
json.url room_url(room, format: :json)
