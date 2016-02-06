Feature: Edit categories
	As a blog administrator
	In order to organize my blog
	I want to be able to edit existing categories

	Background:
	  Given the blog is set up
	  And I am logged into the admin panel
	  And the following "categories" exist:
	  | name      | keywords          | description       |
	  | test_name | category, test    | this is something |

	Scenario: Edit existing category
	  Given I am on the admin content page
	  When I follow "Categories"
	  Then I should be on the new admin category page
	  And  I should see "test_name"
	  When I follow "test_name"
	  Then the "Name" field should contain "test_name"
	  And the "Keywords" field should contain "category, test"
	  And the "Description" field should contain "this is something"
	  When I fill in "Name" with "new_name_updated"
	  And I press "Save"
	  Then I should see "new_name_updated"
