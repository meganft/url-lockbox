class Read < ApplicationRecord
  belongs_to :link

  def self.send_to_hotreads(link)
    HotReadsService.post_link_to_hot_reads(title: link.title, url: link.url)
  end
end
