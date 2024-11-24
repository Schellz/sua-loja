class OrderCreator
    def initialize(user:, product:, quantity:)
      @user = user
      @product = product
      @quantity = quantity
    end
  
    def call
      return { success: false, error: "Not enough stock" } if @product.stock < @quantity
  
      order = Order.new(user: @user, product: @product, quantity: @quantity, total_price: @product.price * @quantity)
      if order.save
        @product.update(stock: @product.stock - @quantity)
        { success: true, order: order }
      else
        { success: false, error: order.errors.full_messages }
      end
    end
  end
  