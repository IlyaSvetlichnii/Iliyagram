class Post < ActiveRecord::Base
	has_attached_file :image, styles: { :medium => "300x300" }
end