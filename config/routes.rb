Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'visitors#index'

  post 'twilio/voice' => 'twilio#voice'

  # need to change this to POST, so that user's number gets sent. right now, my number hardcoded. 
  post 'twilio/send_text_message' => 'twilio#send_text_message', :as => 'send_text'

  post 'twilio/give_link' => 'twilio#give_link', :as => 'give_link'

  get 'twilio/give_link' => 'twilio#give_link', :as => 'give_link_get'


end
