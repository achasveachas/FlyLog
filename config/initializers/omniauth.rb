OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, 'c985874ed9e97668638d', 'a19fcdd699bc4a3b659a323206a610197dfbae7e', scope: "user"
end
