json.status true
json.categories do
  json.id @category.id
  json.name @category.name
  json.monthly_limit @category.monthly_limit
  json.created_at @category.created_at
  json.updated_at @category.updated_at
end
