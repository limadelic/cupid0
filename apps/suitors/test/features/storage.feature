Feature: Job Storage
  As a job seeker
  I want to store job opportunities
  So that I can review and apply to them later

  Scenario: Store and count jobs
    When jobs.json is imported into storage
    Then Suitors sees 5 jobs
