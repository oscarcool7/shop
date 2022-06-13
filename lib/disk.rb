class Disk < Product
  attr_reader :price

  def initialize(params)
    super

    @title = params[:title]
    @musician = params[:musician]
    @genre = params[:genre]
    @year = params[:year]
  end

  def to_s
    "Album #{@musician} - \"#{@title}\", #{@genre}, #{@year}, #{super}"
  end

  def update(params)
    super

    @title = params[:title] if params[:title]
    @musician = params[:musician] if params[:musician]
    @genre = params[:genre] if params[:genre]
    @year = params[:year] if params[:year]
  end

  def self.from_file(file_path)
    lines = File.readlines(file_path, encoding: "UTF-8").map(&:chomp)

    self.new(
      title: lines[0],
      musician: lines[1],
      genre: lines[2],
      year: lines[3].to_i,
      price: lines[4].to_i,
      amount: lines[5].to_i
    )
  end
end
