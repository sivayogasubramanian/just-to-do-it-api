class ApplicationController < ActionController::API
  before_action :authenticate_request
  attr_reader :current_user
  skip_before_action :authenticate_request, :only => [:default_startup_screen]

  def default_startup_screen
    render html: '<h1>
                    Just To-do it api is running
                  </h1>
                  <h3>
                    Visit 
                    <a href="https://just-to-do-it-website.netlify.app">
                      https://just-to-do-it-website.netlify.app
                    </a>
                     to get started!
                  </h3>'.html_safe
  end

  private

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end
end