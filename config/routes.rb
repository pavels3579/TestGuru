Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'tests#index'

  resources :tests do
    resources :questions, shallow: true
  end

  #get '/tests', to: 'tests#index'

  #get '/tests/:test_id/questions', to: 'test_questions#index'

  #get '/questions/:id', to: 'questions#show'

  #post '/tests/:test_id/questions/:id' , to: 'questions#create'

  get '/questions/:id/delete', to: 'questions#destroy'
end
