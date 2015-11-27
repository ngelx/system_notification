SystemNotification::Engine.routes.draw do
  put '/messages/:id/seen', to: 'messages#seen', as: 'message_seen'
  put '/messages/:id/dismiss', to: 'messages#dismiss', as: 'message_dismiss'
end
