require 'rails_helper'

module SystemNotification
  RSpec.describe Message, type: :model do
    describe 'Basic' do
      it 'Message is a valid factory' do
        expect(FactoryGirl.build(:system_notification_message).valid?).to be true
      end


    end

    describe 'seen/unseen' do
      let(:user) { FactoryGirl.create(:user) }

      before :each do
        create_list(:system_notification_message, 3, user: user)
      end

      it {expect(user.notifications.take.seen?).to be false}
      it {expect(user.notifications.unseen.length).to be 3}
      it {
        n = user.notifications.take
        n.seen!
        expect(n.seen?).to be true
      }
      it {
        n = user.notifications.take
        n.seen!
        expect(user.notifications.unseen.length).to be 2
      }
    end

    describe 'dismiss/not_dismissed' do
      let(:user) { FactoryGirl.create(:user) }

      before :each do
        create_list(:system_notification_message, 3, user: user)
      end

      it {expect(user.notifications.take.dismiss?).to be false}
      it {expect(user.notifications.not_dismissed.length).to be 3}
      it {
        n = user.notifications.take
        n.dismiss!
        expect(n.dismiss?).to be true
      }
      it {
        n = user.notifications.take
        n.dismiss!
        expect(user.notifications.not_dismissed.length).to be 2
      }
    end
  end
end
