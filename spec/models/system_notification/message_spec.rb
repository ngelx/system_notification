require 'rails_helper'

module SystemNotification
  RSpec.describe Message, type: :model do
    describe 'Basic' do
      it 'Message is a valid factory' do
        expect(FactoryGirl.build(:system_notification_message).valid?).to be true
      end
    end
  end
end
