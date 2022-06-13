class Product
  attr_accessor :amount

  def initialize(params)
    @price = params[:price]
    @amount = params[:amount]
  end

  def to_s
    "#{@price}$ (#{@amount} left)"
  end

  def update(params)
    @price = params[:price] if params[:price]
    @amount = params[:amount] if params[:amount]
  end

  def self.from_file(file_path)
    raise NotImplementedError
  end
end
