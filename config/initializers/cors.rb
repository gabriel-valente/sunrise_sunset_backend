Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://localhost:5173' # Allow requests from your React frontend
    resource '*', 
      headers: :any, 
      methods: [:get]
  end
end