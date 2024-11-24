def create
    user = User.find(order_params[:user_id])
    product = Product.find(order_params[:product_id])
  
    result = OrderCreator.new(user: user, product: product, quantity: order_params[:quantity]).call
  
    if result[:success]
      render json: result[:order], status: :created
    else
      render json: { error: result[:error] }, status: :unprocessable_entity
    end
  end
  