require "paperclip"

Paperclip.options[:log] = false
Paperclip::Attachment.default_options.merge!(
  storage: :dropbox, dropbox_credentials: Rails.root.join("config/dropbox.yml"),
  processors: [:noop]
)

module Paperclip
  class Noop < Processor
    def make
      file
    end
  end
end

Paperclip.configure do |config|
  config.register_processor :noop, Paperclip::Noop
end
