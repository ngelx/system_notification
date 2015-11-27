class User < ActiveRecord::Base
  include SystemNotification::User
  
end
