class AppsService
  def save_apps(apps_with_category)
    apps_with_category.each do |category, app|
      puts "Category: #{category}, app: #{app}"
    end
  end
end