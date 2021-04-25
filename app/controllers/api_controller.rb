class ApiController < ActionController::Base
  include Knock::Authenticable
  undef_method :current_user

  protect_from_forgery with: :null_session

end