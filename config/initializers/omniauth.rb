Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, "A8cQ04YKN9oWObnlcSpvR1keN", "8BDUh5eHpDJNTCEODCkOzqJfaGYSgv8ETg70T0ATdDjOYyPIkB",
  {
      :authorize_params => {
        :force_login => 'true',
        :lang => 'en'
      }
  }
end