Rails.application.routes.draw do
  mount InnerMessenger::Engine => "/inner_messenger"
end
