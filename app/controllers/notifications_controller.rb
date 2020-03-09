class NotificationsController < ApplicationController

  def index #to show all notifications (see more on the dropdown)
    @notifications = Notification.all
  end

  def create
    @notification = Notification.new
    @notification.save
  end

  def destroy

  end



end
