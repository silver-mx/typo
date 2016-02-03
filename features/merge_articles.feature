Feature: Merge articles
	As a blog administrator
	In order to organize content of articles
	I want to be able to merge two articles
	
	Background:
		Given the blog is setup
		And I am logged in the admin panel
		And the following articles exist:
		| article_title | article__body_and_extended_editor |
		| article_1     | article__body_1                   |
		| article_2     | article__body_2                   |
		And the following comments exist:
		| author | body  | email         | url                 |
		| user_1 | bla_1 | a.b@gmail.com | http://fake_url_1   | 
		| user_2 | bla_2 | c.d@gmail.com | http://fake_url_2   | 

	Scenario: Successfully merge two articles with comments
		Given I am on the home page
		Then I should see "article_1"
		And I should see "article_2"
		When I follow "article_1"
		Then I should see "article__body_1"
		And I should see "Merge Articles"
		When I fill in "Article ID" with the ID of another article
		And I press "Merge"
		Then I should be on the admin content page
		When I go to the home page
		Then I should see "article_1"
		And I should not see "article_2"
		When I follow "article_1"
		Then I should see "article__body_1"
		And I should see "article__body_2"
