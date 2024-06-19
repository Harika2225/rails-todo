class PublicController < ApplicationController
    def index
      render file: Rails.root.join('public', 'build', 'index.html'), layout: false
    end
    def manifest
      render file: Rails.root.join('public', 'build', 'manifest.json'), layout: false
    end
    def logo192
        send_file Rails.root.join('public', 'build', 'logo192.png'), type: 'image/png', disposition: 'inline'
    end
end
  