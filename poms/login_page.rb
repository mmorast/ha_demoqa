require_relative './base_page'
require_relative './index_page'

class LoginPage < BasePage

  def initialize(webdriver)
    super()
    @driver = webdriver
    @page_path = '/products-page/your-account/'
  end

  def username
    @driver.find_element(:id, 'log').text
  end

  def username=(name)
    @driver.find_element(:id, 'log').send_keys(name)
  end

  def password=(pwd)
    @driver.find_element(:id, 'pwd').send_keys(pwd)
  end

  def login_as(name, pwd)
    @driver.get("#{@url_base}#{@page_path}/") unless driver.current_url == "#{@url_base}#{@page_path}/"
    self.username = name
    self.password = pwd
    self
  end
end