require_relative './account_page'
require_relative './base_page'

class IndexPage < BasePage


  def initialize(webdriver)
    super()
    @driver = webdriver

    goto_page
  end

  def goto_page
    @driver.get(@url_base) unless @driver.current_url == "#{@url_base}"
    self
  end

  def login_as(username, password)
    @driver.find_element(:id, 'account').find_element(:css, 'a').click
    AccountPage.new(driver).login_as(username, password)
    self
  end


  def goto_product_category(product_category)
    goto_page

    prod_cat_menu_item = @driver.find_element(:id, 'menu-item-33')
    @driver.action.move_to(prod_cat_menu_item).perform

    Selenium::WebDriver::Wait.new(timeout:2).until do
      @driver.find_element(:link_text, product_category).displayed?
    end

    @driver.find_element(:link_text, product_category).click
    ProductCategoryPage.new(driver, product_category)
  end
end