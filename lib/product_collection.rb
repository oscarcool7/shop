class ProductCollection
  PRODUCT_TYPES = {
    movie: {dir: "movies", class: Movie},
    book: {dir: "books", class: Book},
    disk: {dir: "disks", class: Disk}
  }

  def initialize(products = [])
    @products = products
  end

  def self.from_dir(dir_path)
    products = []

    PRODUCT_TYPES.each_value do |hash|
      product_dir = hash[:dir]
      product_class = hash[:class]

      Dir["#{dir_path}/#{product_dir}/*.txt"].each do |path|
        products << product_class.from_file(path)
      end
    end

    self.new(products)
  end

  def to_a
    @products
  end

  def delete_product(product)
    @products.delete(product)
  end

  def empty?
    @products.empty?
  end
end
