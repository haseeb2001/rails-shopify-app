# frozen_string_literal: true

class AuthenticatedController < ApplicationController
  include ShopifyApp::Authenticated
end



# include ShopifyApp::Authenticated
#   rescue_from ActionController::InvalidAuthenticityToken, with: :redirect_to_login
#   def index
#     # @session = params[:session]
#     # shop_domain = params[:shop]
#     shop = Shop.find_by(shopify_domain: params[:shop])
#   ]
#     shop = ShopifyApp::SessionRepository.retrieve_shop_session(shop.id)
#     # puts ShopifyApp::SessionRepository.methods.sort
#     # shop = ShopifyApp::SessionRepository.retrieve(shop_domain)


#     # ShopifyAPI::Session.activate_session(shop)
#     @products = ShopifyAPI::Product.all(limit: 10)

#   end
