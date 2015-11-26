Rails.application.routes.draw do

  mount SystemNotification::Engine => "/system_notification"
end
