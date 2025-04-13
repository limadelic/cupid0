Feature: Bouncer
  The bouncer checks IDs at the door

  Scenario: Bouncer asks for ID
    Given I am at the door
    When the bouncer greets me
    Then I should be asked for ID
