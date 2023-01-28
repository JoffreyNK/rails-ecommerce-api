class Api::V1::ProductsController < ApplicationController
    before_action :authenticate_user

    # GET /api/v1/products
    def index
        render json: Product.all, status: :ok
    end

    def create
        if @current_user.isAdmin
            product = Product.new(user_id: @current_user.id, *product_params)
            if product.save
                render json: product, status: 201
            else
                render json: product.errors, status: 401
            end
        else
            render json: {error: 'you are not allowed to create a product, please contact your administrator'}, status: 401
        end
    end


    private
    def product_params
        params.require(:product).permit(:name, :description, :price, :category_id)
    end
end
