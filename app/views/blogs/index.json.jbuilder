json.array!(@blogs) do |blog|
  json.extract! blog, :id, :title, :subject, :content, :tag
  json.url blog_url(blog, format: :json)
end
