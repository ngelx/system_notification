require "system_notification/engine"

module SystemNotification
  module User
    extend ActiveSupport::Concern

    # 'included do' causes the included code to be evaluated in the
    # conext where it is included (user.rb), rather than be
    # executed in the module's context.
    included do
      has_many :notifications, class_name: 'SystemNotification::Message'
    end

    # instance methods

    module ClassMethods
      # class method(s)
    end
  end

  module Controller
    extend ActiveSupport::Concern

    included do
      helper_method :current_notifications, :add_notification
    end

    # Get not dismissed notifications for current user
    # @return [ActiveRecord::AssociationRelation]
    def current_notifications
      @current_notifications ||= current_user.notifications.not_dismissed
    end

    # Add a notification message to the current_user
    #
    # @param text: [string] the notification message
    # @param level: [Symbol] (optional), The notification level. SystemNotification::Message.levels
    #
    def add_notification(args = {level: nil, text: nil})
      current_user.notifications.create(args)
    end


    module ClassMethods
      # class method(s) available for every controller
    end
  end
end
