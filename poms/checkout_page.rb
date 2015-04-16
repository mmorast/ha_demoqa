require_relative './base_page'

class CheckoutPage < BasePage

  def initialize(webdriver)
    super()
    @driver = webdriver
    @page_path = "/products-page/checkout/"
  end

  def goto_page
    @driver.get("#{@url_base}#{@page_path}/") unless @driver.current_url == "#{@url_base}#{@page_path}/"
    self
  end

  def remove_product(product_to_rm)
    product_table = @driver.find_element(:css, 'table.checkout_cart')
    table_rows = product_table.find_elements(:css, "tr")
    table_rows.each do |row|
      if row.text.include?(product_to_rm)
        row.find_element(:css, "input[value='Remove']").click

      end

    end

  end

  def is_empty?
    @driver.find_element(:css, "#entry-element").text.contains?("Oops, there is nothing in your cart.")
  end
end