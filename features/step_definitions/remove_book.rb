#encoding: utf-8

And /^I remove the book from my shopping cart$/ do
  openShoppingCart
  removeTheFirstItem
end

Then /^I should not see the book in my shopping cart$/ do
  verifyMyShoppingCartIsEmpty
end

def removeTheFirstItem
  clickElementBy("xpath","//span[@class='a-declarative']//input[@type='submit']")
  sleep(10)
end

def verifyMyShoppingCartIsEmpty
  openShoppingCart
  content = findElementBy("xpath","//div[@id='sc-active-cart']//div[@class='a-row sc-cart-header']/h1")
  expect(content.text).to eq("Your Shopping Cart is empty.")
end
