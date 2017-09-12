class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new(product_type_id: params[:product_type_id])
    @product.product_type.fields.each { |field| @product.product_properties.build(:product_field_id=>field.id, field_type: field.field_type, label_name: field.name) }
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product, notice: 'Product was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(product_params)
      redirect_to @product, notice: 'Product was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_url
  end

  def product_params
    params.require(:product).permit(:name, :price, :product_type_id, product_properties_attributes: [:id, :product_field_id, {:data => []}, :product_id])
  end
end
