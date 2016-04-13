#encoding utf-8

Given /^I open "(.*?)"$/ do |site|
  @driver.get site
end

And /^I login as "(.*?)" with "(.*?)"$/ do |username,password|
  loginAs(username,password)
end

When /^I search for "(.*?)"$/ do |keyword|
  searchByKeyword(keyword)
end

And /^I open the first book$/ do
  openTheFirstItemInSearchResult
end

And /^I add the first book to Wish List$/ do
  getCurrentItemTitle
  clickElementBy("id","add-to-wishlist-button-submit")
  sleep(10);
  clickElementBy("id","WLHUC_viewlist")
end

And /^I add the first book to shopping cart from Wish List$/ do
  clickElementBy("xpath","//div[@class='a-section a-spacing-none g-item-sortable']//div[@id='itemAction_I3FW8ISW5U6IEY']//span[@class='a-button-inner']/a")
end

And /^I open my shopping cart$/ do
  clickElementBy("id","nav-cart")
  @driver.save_screenshot("screenshot.png")
end

Then /^I should see the book in my shopping cart$/ do

end


def searchByKeyword(keyword)
  searchKeyword = findElementBy("id","twotabsearchtextbox")
  searchKeyword.clear
  searchKeyword.send_keys keyword
  clickElementBy("class","nav-input")
end

def getCurrentItemTitle
  @bookTitle = findElementBy("id","productTitle").text
end

def findElementBy(type,value)
  if type == "class"
    element = @driver.find_element :class => value
  elsif type == "css"
    element = @driver.find_element :css => value
  elsif type == "id"
    element = @driver.find_element :id => value
  elsif type == "link"
    element = @driver.find_element :link => value
  elsif type == "name"
    element = @driver.find_element :name => value
  elsif type == "partial_link"
    element = @driver.find_element :partial_link_text => value
  elsif type == "tag"
    element = @driver.find_element :tag_name => value
  elsif type == "xpath"
    element = @driver.find_element :xpath => value
  else
    p "incorrect selector type"
  end
end


def clickElementBy(type,value)
  findElementBy(type,value).click
end

def inputToElementWith(type,value,input)
  inputElement = findElementBy(type,value)
  inputElement.clear
  inputElement.send_keys input
end

def waitForJsOrAjax
  sleep(10)
end

def addToShoppingCart
  clickElementBy("name","submit.add-to-cart")
end

def openShoppingCart
  clickElementBy("id","nav-cart")
  sleep(10)
end

def loginAs(username,password)
  clickElementBy("id","nav-link-yourAccount")
  clickElementBy("xpath","//div[@id='nav-flyout-ya-signin']//a[@class='nav-action-button']/span")
  inputToElementWith("id","ap_email",username)
  inputToElementWith("id","ap_password",password)
  clickElementBy("id","signInSubmit")
end

def openTheFirstItemInSearchResult
  clickElementBy("xpath","//li[@id='result_0']//img[@class='s-access-image cfMarker']")
end

def verifyItemAddedToShoppingCart
  confirm = findElementBy("xpath","//div[@id='huc-v2-order-row-message']//h1[@class='a-size-medium a-text-bold']")
  confirm.text.include?("Added to Cart")
end
