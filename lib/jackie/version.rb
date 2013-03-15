module Jackie
  class Version < Base
    def preview_url
      "http://kickfolio.com/v/#{app_id}/version/#{id}"
    end
  end
end
