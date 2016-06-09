Rails.application.routes.draw do
  mount InnerMessenger::Engine => '/inner_messenger', as: :inner_messenger
end
