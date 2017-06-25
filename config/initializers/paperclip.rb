defaults = {
  storage: :cloudinary,
  path: 'acercaringenieria/:rails_env/:class/:attachment/:hash.:extension',
  hash_secret: Rails.application.secrets.secret_key_base
}

defaults.each do |key, value|
  Paperclip::Attachment.default_options[key] = value
end
