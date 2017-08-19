class AppsController < ApplicationController

  def index
    apps_service = AppsService.new

    apps = Obtainer.new.upload
    apps_service.save_apps apps

    @apps = App.all
  end

end