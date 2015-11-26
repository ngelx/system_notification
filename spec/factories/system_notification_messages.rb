FactoryGirl.define do
  factory :system_notification_message, :class => 'SystemNotification::Message' do
    user_id 1
seen false
dismiss false
level ""
text "MyText"
  end

end
