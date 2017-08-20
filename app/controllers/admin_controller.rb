class AdminController < ApplicationController
  def edit
    @admin = Admin.first || Admin.new
  end

  def update
    @admin = Admin.first || Admin.create

    if @admin.update(admin_params)
      Sidekiq.set_schedule('apps_upload_worker', {
          :interval => "#{@admin.refresh_time}m",
          :class => 'AppsUploadWorker',
          :queue => 'default'
      })
      redirect_to admin_path
    else
      render :edit
    end
  end

  private

  def admin_params
    params.require(:admin).permit(:refresh_time, :date_of_upload)
  end
end