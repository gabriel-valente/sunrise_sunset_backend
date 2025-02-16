# Sunrise/Sunset Rails app

How to run the application:

Requirements:

- Ruby 3.3.7
- Rails 8.0.1

Run the application:

- > rails s

Troubleshooting:

- Problems related with CORS:
  Depending how how the React app is initiated, the port of that application may be different from :5173
  If the React app cannot call the backend, change the file: config/initializers/cors.rb:3:35 to match the port of the runnig React app.
