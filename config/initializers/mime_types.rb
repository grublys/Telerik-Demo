# Be sure to restart your server when you modify this file.

# Add new mime types for use in respond_to blocks:
# Mime::Type.register "text/richtext", :rtf
# Mime::Type.register_alias "text/html", :iphone

Rack::Mime::MIME_TYPES.merge!({
  ".mp4" => "video/mp4",
  ".m4v" => "video/mp4",
  ".mov" => "video/quicktime",
  ".ogg" => "video/ogg",
  ".webm" => "video/ogg"
})
