json.array! @users do |user|
  json.id user.id
  json.name user.name

  json.secrets user.secrets do |secret|
    json.id secret.id
    json.title secret.title
    json.comment secret.comment 
  end
end
