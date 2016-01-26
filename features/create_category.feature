Feature: Create categories
	As a blog administrator
	In order to organize my blog
	I want to be able to create new categories

	Background:
	  Given the blog is set up
	  And I am logged into the admin panel

	Scenario: Create new category
	  Given I am on the admin content page
	  When I follow "Categories"
	  Then I should be on the new admin category page
	  When I fill in "Name" with "category_name_test"
	  And I fill in "Keywords" with "category, test"
	  And I fill in "Description" with "this is a description"
	  And I press "Save"
	  Then I should see "category_name_test"
