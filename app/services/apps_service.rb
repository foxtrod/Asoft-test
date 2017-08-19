class AppsService
  def save_apps(apps_with_category)
    created_at = Time.now
    apps_with_category.each do |category, apps|
      apps.each do |app|
        App.create!(:title => app[:name], :link => app[:url], :position => app[:position],
                    :category => category, :created_at => created_at)
      end
    end
  end
end