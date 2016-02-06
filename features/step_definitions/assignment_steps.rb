=begin
Given /the following categories exist/ do |categories_table|
  categories_table.hashes.each do |category|
    Category.new(category).save
  end
end
=end

When /^(?:|I )fill in "([^"]*)" with the ID of article "([^"]*)"$/ do |field, article_title|
  article_id = Article.find_by_title(article_title).id
  fill_in(field, :with => article_id)
end

Given /^(?:|And )the following "([^"]*)" exist:/ do |item, table|
    
  if item == 'categories'
  	table.hashes.each do |category|
    	Category.new(category).save
  	end
  elsif item == 'users'
    table.hashes.each do |user|
      user = User.new(user)
      user.state = 'active'
      user.save
    end 	
  elsif item == 'articles'
  	table.hashes.each do |article|
  		article = Article.new(article)
      article.published = true
      article.save
  	end
  elsif item == 'comments'
  	table.hashes.each do |comment_data|
  		comment_data[:type] = 'Comment'
      article = Article.get_or_build_article(comment_data[:article_id])
      comment = article.comments.build(comment_data)
      comment.user_id = 1
      comment.save
	  end
  end
end

