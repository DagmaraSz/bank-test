Feature: Main acceptance test

  Scenario Outline: Client sees a statement with a few transactions
    Given a client has an account
    And makes a <transaction> of <amount> on <date>
    And makes a <transaction> of <amount> on <date>
    And makes a <transaction> of <amount> on <date>
    Then she would see the right bank statement

    Examples:
      | transaction | amount |  date        |
      | deposit     | 1000   |  10-01-2012  |
      | deposit     | 2000   |  13-01-2012  |
      | withdrawal  | 500    |  14-01-2012  |
