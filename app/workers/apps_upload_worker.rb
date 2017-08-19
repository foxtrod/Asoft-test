class AppsUploadWorker
  include Sidekiq::Worker

  def perform(*args)
    apps = Obtainer.new.upload
    AppsService.new.save_apps apps
  end
end
