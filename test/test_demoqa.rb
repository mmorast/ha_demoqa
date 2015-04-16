
require 'minitest/autorun'
require 'selenium-webdriver'
require_relative '../poms/index_page'
require_relative '../poms/product_page'


class TestDemoqa < Minitest::Test


  def setup
    @driver = Selenium::WebDriver.for :firefox
    @driver.manage.timeouts.implicit_wait = 5


  end

  def teardown
    @driver.close
  end

  # Fake test
  def test_removing_items_from_cart_results_in_empty_cart_message
    product = 'Apple iPhone 4S 16GB SIM-Free - Black'
    index_pg = IndexPage.new(@driver).login_as('mm_tester', 'aiJW3kiH8D4R')
    iphone_4s_pg = ProductPage.new(@driver, 'iPhones', product).goto_page
    iphone_4s_pg.add_to_cart
    checkout_pg = iphone_4s_pg.select_checkout_after_add
    checkout_pg.remove_product(product)
    assert_equal(true, checkout_pg.is_empty?, "The shopping cart did not display a message it is empty after removing last item.")
  end
end