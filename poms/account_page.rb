require_relative './base_page'
require_relative './index_page'

class AccountPage < BasePage

  def initialize(webdriver)
    super()
    @driver = webdriver
    @page_path = '/products-page/your-account/'
  end

  def goto_page
    @driver.get("#{@url_base}#{@page_path}/") unless @driver.current_url == "#{@url_base}#{@page_path}/"
    self
  end

  def username
    @driver.find_element(:id, 'log')
  end

  def username=(name)
    a = self.username
    a.clear
    a.send_keys(name)
    self
  end

  def password=(pwd)
    a = @driver.find_element(:id, 'pwd')
    a.clear
    a.send_keys(pwd)
    self
  end

  def login_button
    @driver.find_element(:id, "login")
  end

  def purchase_history
    @driver.find_element(:link_text, 'Purchase History')
  end

  def details
    @driver.find_element(:link_text, 'Your Details')
  end

  def downloads
    @driver.find_element(:link_text, 'Your Downloads')
  end

  def login_as(name, pwd)
    @driver.get("#{@url_base}#{@page_path}/") unless driver.current_url == "#{@url_base}#{@page_path}/"
    self.username = name
    self.password = pwd
    self.login_button.click
    self
  end

  def first_name_locator
    @driver.find_element(:id, 'wpsc_checkout_form_2')
  end

  def first_name
    self.first_name_locator.attribute('value')
  end

  def first_name=(name)
    a = self.first_name_locator
    a.clear
    a.send_keys(name)
    self
  end

  def last_name_locator
    @driver.find_element(:id, 'wpsc_checkout_form_3')
  end

  def last_name
    self.last_name_locator.attribute('value')
  end

  def last_name=(name)
    a = self.last_name_locator
    a.clear
    a.send_keys(name)
    self
  end

  def address
    @driver.find_element(:id, 'wpsc_checkout_form_4')
  end

  def address=(address)
    a = self.address
    a.clear
    a.send_keys(address)
    self
  end

  def city
    @driver.find_element(:id, 'wpsc_checkout_form_5')
  end

  def city=(city)
    a = self.city
    a.clear
    a.send_keys(city)
    self
  end

  def country
    @driver.find_element(:id, 'wpsc_checkout_form_7')
  end

  def country=(country)
    Selenium::WebDriver::Support::Select.new(self.country).select_by(:text, country)
    self
  end

  def postal_code
    @driver.find_element(:id, 'wpsc_checkout_form_8')
  end

  def postal_code=(code)
    a = self.postal_code
    a.clear
    a.send_keys(code)
    self
  end

  def phone
    @driver.find_element(:id, 'wpsc_checkout_form_9')
  end

  def phone=(number)
    a = self.phone
    a.clear
    a.send_keys(number)
    self
  end

  def same_as_billing_address_locator
    @driver.find_element(:id, 'shippingSameBilling')
  end

  def set_same_as_billing_address
    self.same_as_billing_address_locator.click
  end

  def save_profile
    @driver.find_element(:css, 'input[name="submit"]').click
  end

  def switch_to_details_tab
    self.details.click
  end

  def logout
    @driver.find_element(:link_text, 'Log out').click
  end

end