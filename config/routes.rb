Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  get 'say_hello/:name', to: 'api#say_hello'
  get 'http_call/users/:id', to: 'api#http_call'
  # get 'db_call', to: 'api#db_call'
  get 's3_listBucket_call', to: 'api#s3_listBucket_call'
  get 's3/describe/:bucket_name', to: 'api#describe_s3_bucket'
  get 'sns/publish', to: 'api#sns_publish'
end
