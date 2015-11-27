SystemNotification::Engine.routes.draw do
  get '/message/:id/seen', to: 'message#seen', as: 'message_seen'
  get '/message/:id/dismiss', to: 'message#dismiss', as: 'message_dismiss'
end
