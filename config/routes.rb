InnerMessenger::Engine.routes.draw do
  scope ':user_id', as: :inner_messenger, constraints: InnerMessenger::UserConstraint, format: false do
    resources :messages, only: [:new, :create]

    get '' => 'messages/received#index'
    namespace :messages, only: [:index, :show, :destroy] do
      resources :received, param: :message_id, as: :received
      resources :sent, param: :message_id, as: :sent
    end
  end
end

