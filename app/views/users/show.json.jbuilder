json.status true

json.data do
  json.id @user.id
  json.name @user.name
  json.email @user.email
  json.mobile_number @user.mobile_number
  json.created_at @user.created_at
end
