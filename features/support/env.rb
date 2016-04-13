Before do
  @driver = Selenium::WebDriver.for :firefox
  # @driver.manage.timeouts.implicit_wait = 60
  # @driver.manage.timeouts.script_timeout = 60
  # @driver.manage.timeouts.page_load = 60
  # @searchresult = SearchResult.new(@driver)
  # @home = Home.new(@driver)
  # @login = Login.new(@driver)
  # @page = Page.new(@driver)
  # @itemDetails = ItemDetails.new(@driver)
  # @shoppingCart = ShoppingCart.new(@driver)
end

After do
  @driver.quit
end
