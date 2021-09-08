class FeeCalculator
  def calculate(product, user, vat, save_result)
    # calculation

    if save_result
      # storing result into db
    end
  end
end

class ProductController
  def show
    @fee = FeeCalculator.new.calculate(product, user, vat, false)
  end
end

class OrderController
  def create
    @fee = FeeCalculator.new.calculate(product, user, vat, true)
  end
end