Feature: Main acceptance test

  Scenario: Client sees a statement with a few transactions
    Given a client has an account
    And makes a deposit of 1000 on 10-01-2012
    And makes a deposit of 2000 on 13-01-2012
    And makes a withdrawal of 500 on 14-01-2012
    Then she would see the right bank statement
