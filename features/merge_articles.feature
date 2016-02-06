Feature: Merge articles
	As a blog administrator
	In order to organize content of articles
	I want to be able to merge two articles
	
	Background:
		Given the blog is set up

		And the following "articles" exist:
		| title 	    | body            | allow_comments | user_id |
		| article_1     | article body 1 | t               | 1 |
		| article_2     | article body 2 | t               | 2 |

		And the following "comments" exist:
		| author | body  | email         | url                 | article_id |
		| user_1 | bla_1 | a.b@gmail.com | http://fake_url_1   | 3 |
		| user_2 | bla_2 | c.d@gmail.com | http://fake_url_2   | 4 |

	Scenario: Successfully merge two articles with comments
		Given I am logged into the admin panel
		And I am on the admin content page
		Then I should see "article_1"
		And I should see "article_2"
		When I follow "article_1"
		Then I should see "article body 1"
		And I should see "Merge Articles"
		When I fill in "Article ID" with the ID of article "article_2"
		And I press "Merge"
		Then I should be on the admin content page
		When I go to the home page
		Then I should see "article_1"
		And I should not see "article_2"
		When I follow "article_1"
		Then I should see "article body 1"
		And I should see "article body 2"


	Scenario: Unable to merge two articles because user is not admin
		Given I am logged into the admin panel as blogger
		And I am on the admin content page
		Then I should see "article_1"
		And I should see "article_2"
		When I follow "article_2"
		Then I should see "article body 2"
		And I should not see "Merge Articles"
