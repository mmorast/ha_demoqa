require_relative './base_page'
require_relative './checkout_page'
class ProductPage < BasePage
  def initialize(webdriver, product_category, product)
    super()
    @driver = webdriver
    @product_category = product_category
    @product = product
    @page_path = "/products-page/product-category/#{product_category.downcase}/#{hyphenate_product_string(product)}/"
  end

  def goto_page
    @driver.get("#{@url_base}#{@page_path}/") unless @driver.current_url == "#{@url_base}#{@page_path}/"
    self
  end

  def add_to_cart
    @driver.find_element(:css, 'input[value="Add To Cart"]').click
    self
  end

  def select_checkout_after_add
    @driver.find_element(:link_text, 'Go to Checkout').click
    CheckoutPage.new(@driver)
  end

  private
    def hyphenate_product_string(product_string)
      product_string.downcase
                    .gsub(' - ', '-')
                    .gsub(' ', '-')

    end
end