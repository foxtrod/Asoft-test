class LoadAppsService

  def load_carousel_apps
    document = Nokogiri::HTML(open('https://apps.shopify.com/'))
    document.css("//ul[@class='slideshow-selectors']/li/a").each_with_index do |element, index|
      link = "https://apps.shopify.com/#{ element.to_a[1][1] }"
      name = (JSON.parse element.to_a[0][1])['label']
      App.create(title: name, link: link, position: index, category: 'Carousel')
    end
  end

end