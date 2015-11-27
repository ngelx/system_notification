module SystemNotification
  class ApplicationController < ActionController::Base

    #helper :
    def current_notifications
      @current_notifications ||= current_user.system_notifications
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
