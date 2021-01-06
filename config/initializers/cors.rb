# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
<<<<<<< HEAD
    origins 'https://just-to-do-it-website.netlify.app'
=======
    origins 'https://just-to-do-it-website.netlify.app/'
>>>>>>> a1257f22a4b0c5ddc5ded7bb92cab0dc0d220402

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end

  allow do
<<<<<<< HEAD
    origins 'http://localhost:3000'
=======
    origins 'http://localhost:3000/'
>>>>>>> a1257f22a4b0c5ddc5ded7bb92cab0dc0d220402

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
