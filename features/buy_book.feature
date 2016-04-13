Feature:
In order to purchase it later
As a consumer
I want to add a book to my shopping cart

@single
Scenario: Consumer can add a book to shopping cart
    Given I open "http://www.amazon.com"
    When I search for "The Lean Startup"
    And I open the first book
    And I add the first book to shopping cart
    Then I should see the book in my shopping cart

@multiple
Scenario Outline: Consumer can add a book to shopping cart
    Given I open "http://www.amazon.com"
    When I search for "<book>"
    And I open the first book
    And I add the first book to shopping cart
    Then I should see the book in my shopping cart
    Examples:
    | book               |
    | The Lean Startup   |
    | Steve Jobs         |

@fromWishList
Scenario: Consumer can add a book to shopping cart from wish list
    Given I open "http://www.amazon.com"
    And I login as "xiaojuanxu123456@gmail.com" with "xxj19881101"
    When I search for "The Lean Startup"
    And I open the first book
    And I add the first book to Wish List
    And I add the first book to shopping cart from Wish List
    And I open my shopping cart
    Then I should see the book in my shopping cart
