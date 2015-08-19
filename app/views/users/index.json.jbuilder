json.array!(@users) do |user|
  json.extract! user, :id, :email, :password, :name, :birthday, :gender, :address, :tel
  json.url user_url(user, format: :json)
end
