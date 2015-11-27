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

    def xx_module
      "XX module"
    end

    module ClassMethods
      #has_many :notifications, class_name: 'SystemNotification::Message'
      def xx_class
        'XX Class'
      end
    end

  end
end
