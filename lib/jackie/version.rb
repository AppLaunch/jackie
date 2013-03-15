module Jackie
  class Version < Base
    self.prefix = "apps/:app_id/"

    def preview_url
      "http://kickfolio.com/v/#{app_id}/version/#{id}"
    end
  end
end
