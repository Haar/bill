Feature: User - Billing
  User views billing history

  Scenario: User views their latest bill
    Given I am signed up
    And I have at least one bill
    When I am on the bills page
    Then I should see my latest bill
    And I should be able to drill down my services
    And I should be able to drill down my Phone charges
    And I should be able to drill down my TV charges
    And I should be able to download a PDF of my bill
