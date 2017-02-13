class HotReadsService

  def self.post_link(link)
    conn = Faraday.new(url: "https://arcane-escarpment-10807.herokuapp.com/")
    conn.post '/api/v1/hotreads', {link: link}
  end

end
