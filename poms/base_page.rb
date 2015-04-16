class BasePage

  attr_accessor :driver, :url_base, :page_path


  def initialize()
    @url_base = 'http://store.demoqa.com'
  end


end