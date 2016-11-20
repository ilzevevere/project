Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "1797985973782234", "b020732a90b275a9f80736120cd961fe", { :scope => 'user_location, user_birthday, user_about_me, email' }
end

#export FACEBOOK_KEY=1797985973782234
#export FACEBOOK_SECRET=b020732a90b275a9f80736120cd961fe
