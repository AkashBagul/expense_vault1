if @categories.present?
  categories_count = @categories.count

  json.status true
  json.count categories_count
  json.categories @categories, partial: "categories/category", as: :category
else
  json.status true
  json.count 0
  json.categories []
end
