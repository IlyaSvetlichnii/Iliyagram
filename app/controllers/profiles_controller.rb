class ProfilesController < ApplicationController
	def show  
	  @posts = User.find_by(name: params[:name]).posts.order('created_at DESC')
	end  
end
