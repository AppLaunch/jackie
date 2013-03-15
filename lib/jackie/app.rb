module Jackie
  class App < Base
    def last_preview_url
      "http://kickfolio.com/w/#{public_key}"
    end

    def versions
      Version.find(:all, :params => { :app_id => self.id })
    end
  end
end
