require 'rails_helper'

module SystemNotification
  RSpec.describe Message, type: :model do
    describe 'Basic' do
      it 'Message is a valid factory' do
        expect(FactoryGirl.build(:system_notification_message).valid?).to be true
      end

      it 'User has defined the has_many accessor' do
        message = FactoryGirl.create(:system_notification_message)

        user = message.user

        expect(user.notifications.count).to be 1
      end

    end
  end
end
