# frozen_string_literal: true

class ProductsController < ApplicationController

  before_action :set_shop
  def index
    @shop.with_shopify_session do
      @products = ShopifyAPI::Product.all(limit: 10)
      # render(json: @products.first.variants)
    end
  end

  def show
    @shop.with_shopify_session do
      @product = ShopifyAPI::Product.find(id: params[:id])
      # render(json: params)
    end
  end

  def edit
    @shop.with_shopify_session do
      @product = ShopifyAPI::Product.find(id: params[:id])
    end
  end

  def update
    @shop.with_shopify_session do
      puts params
      product = ShopifyAPI::Product.find(id: params[:id])
      if params[:variant_id].present?
        product.variants.map do |item|
          if item.id == params[:variant_id].to_i
            item.option1 = params[:variant_size]
            item.option2 = params[:variant_colour]
            item.price = params[:variant_price]
          end
        end
        product.save
      else
        product.title = params[:title]
        product.save
      end
      if product.save
        redirect_to products_path, flash: {message:"Product has been changed"}
      else
        render 'new'
      end
    end
  end

  private

  def set_shop
    @shop = Shop.find_by(shopify_domain: 'shoeville12.myshopify.com')
  end
end
