class Obtainer

  DOMAIN = 'https://apps.shopify.com/'
  CAROUSEL_APPS = "//ul[@class='slideshow-selectors']/li/a"
  NEW_APPS = "//ul[@class='app-icon-grid']/li/a"
  CATEGORIZED_APPS = "following-sibling::div[contains(@class, 'col8')]//a[@class='appcard-overlay']"

  def upload
    doc = Nokogiri::HTML(open(DOMAIN))
    {
        'Carousel apps': get_carousel_apps(doc),
        'New apps': get_new_apps(doc),
    }.merge!(get_apps_with_category(doc))
  end

  def get_carousel_apps(doc)
    obtain_apps(doc, CAROUSEL_APPS)
  end

  def get_new_apps(doc)
    obtain_apps(doc, NEW_APPS)
  end

  def get_apps_with_category(doc)
    apps_with_category = {}
    doc.xpath("//div[@class='col4']").each do |category|
      apps_with_category[category.xpath('h2').text.strip] = obtain_apps(category, CATEGORIZED_APPS)
      puts apps_with_category
    end
    apps_with_category
  end

  def obtain_apps(doc, path)
    doc.xpath(path).each_with_index.map { |a, index|
      {
          name: JSON(a['data-track-click'])['label'],
          position: index + 1,
          url: URI.join(DOMAIN, a['href']).to_s
      }
    }
  end

end

