FactoryBot.define do
  factory :system_notification_message, class: 'SystemNotification::Message' do
    user
    seen false
    dismiss false
    level :debug
    text 'MyText'
  end

  factory :system_notification_message_seen, parent: :system_notification_message do
    seen true
  end

  factory :system_notification_message_dismiss, parent: :system_notification_message do
    dismiss true
  end
end
