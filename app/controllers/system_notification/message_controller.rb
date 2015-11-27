require_dependency "system_notification/application_controller"

module SystemNotification
  class MessageController < ApplicationController
    before_action :load_scoped_message

    # seen toggle on controller
    # PUT [:mount_point]/system_notification/message/[:id]/seen
    def seen
      @message.seen!
      respond_to do |format|
        format.js   {}
        format.json { render json: @message, status: :success}
      end
    end

    # dismiss toggle on controller
    # PUT [:mount_point]/system_notification/message/[:id]/dismiss
    def dismiss
      @message.dismiss!
      respond_to do |format|
        format.js   {}
        format.json { render json: @message, status: :success}
      end
    end

    private

    def load_scoped_message
      @message = current_user.notifications.find_by(id: params[:id])
      return false unless @message
    end
  end
end
