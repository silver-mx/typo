=begin
Given /the following categories exist/ do |categories_table|
  categories_table.hashes.each do |category|
    Category.new(category).save
  end
end
=end


Given /the following "([^"]*)"$ exist/ do |item, table|
    
  if item == 'categories'
  	table.hashes.each do |category|
    	Category.new(category).save
  	end	
  elsif item == 'articles'
	table.hashes.each do |article|
		article[:type] = 'Article'
		Content.new(article).save
	end
  elsif item == 'comments'
  	table.hashes.each do |comment|
		comment[:type] = 'Comment'
		Feedback.new(comment).save
	end
  end
end