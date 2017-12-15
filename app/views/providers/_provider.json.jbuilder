json.extract! provider, :id, :name, :ruc, :phone, :address, :email, :state, :created_at, :updated_at
json.url provider_url(provider, format: :json)
