class BookSerializer
  include JSONAPI::Serializer
  attributes :id, :title ,:image ,:image_url ,:user 
end
