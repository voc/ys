class UserSession < Authlogic::Session::Base
  find_by_login_method :find_by_login
  # allow access with api key
  single_access_allowed_request_types :get
  params_key :api_key
end
