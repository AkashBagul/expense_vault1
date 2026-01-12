json.status true

json.user_data do
  json.id @user.id
  json.name @user.name
  json.email @user.email
  if @user.mobile_number.present?
    json.mobile_number @user.mobile_number
  end
  json.created_at @user.created_at
  json.token @token
end
