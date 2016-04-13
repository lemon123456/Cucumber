Feature:
In order to buy it later
As a consumer
I want to remove a book from my shopping cart


Scenario: Consumer can remove a book from shopping cart
    Given I open "http://amazon.com"
    When I search for "The Lean Startup"
    And I open the first book
    And I add the first book to shopping cart
    And I remove the book from my shopping cart
    Then I should not see the book in my shopping cart
