Feature: Inbox Processing
  As Cupid0
  I want to process new batches of suitors
  So that I can prepare them for matching

  Scenario: Process new suitors batch
    Given a new batch of suitors in the inbox
    When the inbox processor runs
    Then suitor IDs should be recorded
    And the batch should move to the lobby
