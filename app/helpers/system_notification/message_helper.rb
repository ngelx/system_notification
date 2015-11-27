module SystemNotification
  module MessageHelper

    def display_system_message
      content = render :partial => 'system_notification/message/display', :layout => false, :locals => { :messages => messages }
      if block_given?
        capture(content, &block)
      else
        content
      end
    end

    def message_to_class(message)
      return 'alert-success' if message.debug?
      return 'alert-info' if message.info?
      return 'alert-warning' if message.warning?
      return 'alert-error' if message.error?

      return 'alert-success' if message.level0?
      return 'alert-info' if message.level1?
      return 'alert-warning' if message.level2?
      return 'alert-error' if message.level3?
    end

  end
end
