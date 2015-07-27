class AccountsController < ApplicationController

  def create
    provider = request.env['omniauth.auth']['provider']
    case provider
      when 'bigcommerce'
        auth = request.env['omniauth.auth']
        token = auth['credentials']['token'].token
        account = Account.create!(name: provider, token: token)
        redirect_to fetch_account_products_path(account)
    end
  end
end
