FactoryGirl.define do
  factory :system_notification_message, :class => 'SystemNotification::Message' do
    user
    seen false
    dismiss false
    level :debug
    text "MyText"
  end

end
