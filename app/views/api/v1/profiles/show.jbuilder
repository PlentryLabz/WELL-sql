json.(@user,
  :id,
  :email,
  :first_name,
  :second_name,
  :vk_link,
  :twitter_link,
  :instagram_link,
  :birth_date,
  :about,
  :created_at,
  :updated_at)

json.pic @user.pic.url

if @user.city.present?
  json.city(@user.city, :id, :name_ru, :name_en, :time_zone, :latitude, :longitute)
end