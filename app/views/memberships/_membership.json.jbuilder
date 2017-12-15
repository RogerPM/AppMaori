json.extract! membership, :id, :rate_name, :sessions, :service_id, :days_expire, :price, :discount, :type, :state, :created_at, :updated_at
json.url membership_url(membership, format: :json)
