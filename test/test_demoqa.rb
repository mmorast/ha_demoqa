
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

  def test_changes_to_profile_remain_between_authentications
    account_pg = AccountPage.new(@driver).login_as('mm_tester', 'aiJW3kiH8D4R')
    account_pg.switch_to_details_tab
    account_pg.first_name = 'Monte'
    account_pg.last_name = 'Morast'
    account_pg.address = '1234 Somewhere Ln'
    account_pg.city = 'Austin'
    account_pg.country = 'USA'
    account_pg.postal_code = '78759'
    account_pg.save_profile

    account_pg.logout
    account_pg.login_as('mm_tester', 'aiJW3kiH8D4R')
    account_pg.switch_to_details_tab

    assert_equal('Monte', account_pg.first_name, 'The details were not saved between authentications')
  end

  def test_verify_total_price_at_checkout_is_correct
    product = 'Apple iPhone 4S 16GB SIM-Free - Black'

    #pre-fill account information
    account_pg = AccountPage.new(@driver).login_as('mm_tester', 'aiJW3kiH8D4R')
    account_pg.switch_to_details_tab
    account_pg.first_name = 'Monte'
    account_pg.last_name = 'Morast'
    account_pg.address = '1234 Somewhere Ln'
    account_pg.city = 'Austin'
    account_pg.country = 'USA'
    account_pg.postal_code = '78759'
    account_pg.set_same_as_billing_address
    account_pg.save_profile

    iphone_4s_pg = ProductPage.new(@driver, 'iPhones', product).goto_page
    iphone_4s_pg.add_to_cart
    checkout_pg = iphone_4s_pg.select_checkout_after_add
    checkout_pg.continue_to_info_step
    assert_equal('$282.00', checkout_pg.checkout_total, "The Checkout total was incorrect.")
  end
end