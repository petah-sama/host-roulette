class NotificationsController < ApplicationController

  def index #to show all notifications (see more on the dropdown)
    @notifications = Notification.all

  end

  def create
    if params[:from] = 'reminder'
      question = Question.find(params[:question])
      edition = question.edition
      failing_guests = (edition.guests - question.guests)
      failing_guests.each do |guest|
        next if guest.member.user == edition.host
        @notification = Notification.new
        @notification.user = guest.member.user
        @notification.edition = edition
        @notification.from = 'reminder'
        @notification.save
      end

      redirect_back(fallback_location: root_path)
    else
      @notification = Notification.new
      @notification.save
      redirect_back(fallback_location: root_path)
    end

  end

  def destroy
    @notifications = Notification.where user: current_user #policy_scope(Notification)
    @notifications.each do |notification|
      notification.destroy
    end
    redirect_back(fallback_location: root_path)
  end
end
