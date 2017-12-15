json.extract! user, :id, :name, :last_name, :identification_card, :address, :birthday, :phone, :contract_date, :contract_date_end, :position, :state, :created_at, :updated_at
json.url user_url(user, format: :json)
