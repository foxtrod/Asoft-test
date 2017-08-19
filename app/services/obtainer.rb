class Obtainer

  DOMAIN = 'https://apps.shopify.com/'

  def upload
    doc = Nokogiri::HTML(open(DOMAIN))
    {
        carousel_apps: get_carousel_apps(doc)
    }
  end

  def get_carousel_apps(doc)
    doc.xpath("//ul[@class='slideshow-selectors']/li/a").each_with_index.map { |a, i|
      {
          name: JSON(a['data-track-click'])['label'],
          position: i + 1,
          url: URI.join(DOMAIN, a['href']).to_s
      }
    }
  end




end

