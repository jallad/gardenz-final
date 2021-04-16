json.extract! request, :id, :subject, :description, :created_at, :updated_at
json.url request_url(request, format: :json)
