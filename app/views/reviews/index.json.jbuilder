json.array!(@reviews) do |review|
  json.extract! review, :id, :showname, :image, :rating, :year, :number_ep
  json.url review_url(review, format: :json)
end
