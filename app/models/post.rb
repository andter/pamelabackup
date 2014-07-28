class Post < ActiveRecord::Base

def self.ordered_posts
	Post.order("id DESC")
end	

end
