module SystemNotification
  class ApplicationController < ActionController::Base

    helper_method :current_notifications, :add_notification

    # Get not dismissed notifications for current user
    # @return [ActiveRecord::AssociationRelation]
    def current_notifications
      @current_notifications ||= current_user.system_notifications.not_dismissed
    end

    # Add a notification message to the current_user
    #
    # @param text: [string] the notification message
    # @param level: [Symbol] (optional), The notification level. SystemNotification::Message.levels
    #
    def add_notification(args = {level: nil, text: nil})
      current_user.system_notifications
    end

  end
end
