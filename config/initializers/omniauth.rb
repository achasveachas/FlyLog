OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, 'c985874ed9e97668638d', '399789d7eb1e68d76b55cb109a6828fcab22592f', scope: "user"
end
