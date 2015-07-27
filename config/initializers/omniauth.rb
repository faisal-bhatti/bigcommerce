Rails.application.config.middleware.use OmniAuth::Builder do
  provider :bigcommerce,  'doe3uwdosqtzkvm9dqo79ln7gjpa3t2', 'ni6otzsaxn34l4g4e2mcmjkw14dfqqt',
           {
             scope: "users_basic_information store_v2_products store_v2_information store_v2_products_read_only",
             client_options: {
               site: 'https://login.bigcommerce.com'
             }
           }
end