json.array! @secrets do |secret|
  json.id secret.id
  json.title secret.title
  json.comment secret.comment
  json.created_at secret.created_at
  #  json.user do
  #   json.id secret.user.id
  #  end
end
