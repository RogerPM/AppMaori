json.extract! client, :id, :name, :last_name, :identification_card, :gender, :phone, :email, :birthday, :address, :country, :province, :city, :created_at, :updated_at
json.url client_url(client, format: :json)
