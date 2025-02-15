Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://localhost:5173' # Allow requests from React app
    resource '*', 
      headers: :any, 
      methods: [:get]
  end
end