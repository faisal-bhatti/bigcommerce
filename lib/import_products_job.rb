require 'net/http'
require "json"
require 'bigcommerce'

    
ImportProductsJob = Struct.new(:url) do 

  # def perform    ## this function was used for the volusion api call
  #   url = URI.parse('http://www.samplestore.io/api/v1/products/?pageNumber=2&pageSize=20')
  #   req = Net::HTTP::Get.new(url.to_s)
    
  #   res = Net::HTTP.start(url.host, url.port) {|http|
  #     http.request(req)
  #   }
    
  #   response = res.body.encode("ASCII-8BIT").force_encoding("utf-8")
    
  #   data = JSON.parse(response).as_json
    
  #   products = data["data"]
  #   product_array = []
  #   products.each do |product|
  #     existing_product = Product.where(:sku=> product["code"]).first
    
  #     if !existing_product
  #       new_product  = Product.new
  #       new_product.productId =  product["id"]
  #       new_product.name =  product["name"]
  #       new_product.isAvailable =  product["isGiftWrapAvailable"]
  #       new_product.small_image = product["imageCollections"][0]["images"][0]["small"] 
  #       new_product.medium_image  = product["imageCollections"][0]["images"][0]["medium"]
  #       new_product.large_image =  product["imageCollections"][0]["images"][0]["large"]
  #       new_product.bar_code =  product["code"]
  #       new_product.sku =  product["code"]
  #     end
  #     product_array << new_product
  #   end
  #   if Product.import product_array
  #     puts "save"
  #   else
  #     puts "not save"
  #   end
  # end

  def perform
    Bigcommerce.configure do |config|
      config.auth = 'legacy'
      config.url = 'https://store-e4su8p.mybigcommerce.com/api/v2/'
      config.username = 'groove-packer'
      config.api_key = '860ace88bdcad5e221e8d94478a80eac7ed7224a'
    end
    # List products
    @products = Bigcommerce::Product.all

    product_array = []
    @products.each do |product|
      product_json = product.as_json
      existing_product = Product.where(:sku=> product_json["sku"]).first
      if !existing_product
        new_product  = Product.new
        new_product.productId =  product_json["id"]
        new_product.name =  product_json["name"]
        new_product.medium_image  = product_json["primary_image"]["zoom_url"]
        new_product.bar_code =  product_json["sku"]
        new_product.sku =  product_json["sku"]
      end
      product_array << new_product
    end
    if Product.import product_array
      puts "save"
    else
      puts "not save"
    end
  end
end