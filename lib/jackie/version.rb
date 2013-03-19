module Jackie
  class Version < Base
    cattr_accessor :uploader, :instance_writer => false

    class << self
      def set_uploader(uploader)
        self.uploader = uploader
      end
    end

    def preview_url
      "http://kickfolio.com/v/#{app_id}/version/#{id}"
    end

    def save
      self.bundle_url = uploader.upload(attributes["file"]) if attributes["file"] && uploader
      super
    end
  end
end