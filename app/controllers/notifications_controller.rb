class NotificationsController < ApplicationController

  def index #to show all notifications (see more on the dropdown)
    @notifications = Notification.all

  end

  def create
    @notification = Notification.new
    @notification.save
  end

  def destroy

    @notifications = Notification.where user: current_user #policy_scope(Notification)
    @notifications.each do |notification|
      notification.destroy
    end
    redirect_back(fallback_location: root_path)
  end

end
