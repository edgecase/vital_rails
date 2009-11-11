Feature: Manage songs
  In order to manage
  As a user, I
  want to see my song list
  
  Scenario: Register new song
    Given I am on the new song page
    When I fill in "Unity" for "Song Name"
    When I fill in "123" for "Song Duration"
    And I press "Save Song"
    Then I should see "Unity"
    And I should see "123"

  Scenario: Delete song
    Given the following songs:
      |name                       |duration|
      |Unity                      |10      |
      |The Parts of Ruby          |11      |
      |White Sandy Beach of Hawaii|12      |
      |Over the Rainbow           |13      |
    When I delete the 3rd song
    Then I should see the following songs:
      |Name              |Duration|
      |Unity             |10      |
      |The Parts of Ruby |11      |
      |Over the Rainbow  |13      |

  Scenario: Show a song list
    Given the following songs:
      |name             |duration|
      |Unity            |11      |
      |The Parts of Ruby|12      |
    Given I am on the songs page
    Then I should see "Unity"
    And I should see "The Parts of Ruby"

  Scenario: Show a single song
    Given the following songs:
      |name             |duration|
      |Unity            |11      |
      |The Parts of Ruby|12      |
    And I am on the "Unity" song page
    Then I should see "Unity"
    And I should see "11"
    And I should not see "The Parts of Ruby"
