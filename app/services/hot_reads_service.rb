class HotReadsService

  def self.post_link_to_hot_reads(link)
    conn = Faraday.new(:url => "https://arcane-escarpment-10807.herokuapp.com/")
    conn.post '/api/v1/reads', {title: link[:title], url: link[:url]}
  end


end
