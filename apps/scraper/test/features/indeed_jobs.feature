Feature: Indeed Job Scraping
  As a job seeker
  I want to find remote software engineering jobs
  So that I can find opportunities that match my criteria

  Scenario: Search for remote software engineering jobs
    Given I want to search for remote software engineering jobs
    When I search with these criteria:
      | Position          | software engineer |
      | Work Type         | Remote           |
      | Salary            | $135,000+        |
      | Posted Within     | Last 24 hours    |
      | Sort By           | Date             |
    Then I should get a list of matching job postings
    And each job posting should have:
      | Field              |
      | Job title          |
      | Company name       |
      | Location           |
      | Salary information |
      | Post date          |
      | Job description    |
