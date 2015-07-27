class ProductsController < ApplicationController
    # require 'bigcommerce-oauth-api'
  require 'securerandom'
  
  def import
    url = 'http://www.samplestore.io/api/v1/products/?pageNumber=2&pageSize=20'
    Delayed::Job.enqueue ImportProductsJob.new(url)
   
    respond_to do |format|
      format.html {redirect_to products_path}
      format.js   {render json: true}
    end
  end
 

  def fetch
    url = 'http://www.samplestore.io/api/v1/products/?pageNumber=2&pageSize=20'
    Delayed::Job.enqueue ImportProductsJob.new(url)
    redirect_to root_url
  end

  def index
    @pruducts = Product.all
    return render :json=> @pruducts  
  end
end
