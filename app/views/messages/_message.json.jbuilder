json.extract! message, :id, :from, :to, :content, :created_at, :updated_at
json.url message_url(message, format: :json)
