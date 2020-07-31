json.extract! comment, :id, :title, :description, :post_id, :created_at, :updated_at
json.url comment_url(comment, format: :json)
