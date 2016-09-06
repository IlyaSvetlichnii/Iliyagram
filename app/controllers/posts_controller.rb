class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show  
  @post = Post.find(params[:id])
  end 

  def edit  
    @post = Post.find(params[:id])
  end  

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      flash[:success] = "Your post has been created!"
      redirect_to posts_path
    else
      flash[:alert] = "Your new post couldn't be created!  Please check the form."
      render :new
    end
  end

  # def create
  #   if @post = Post.create(post_params)
  #     flash[:success] = "Your post has been created!"
  #     redirect_to posts_path
  #   else
  #     flash.now[:alert] = "Your new post couldn't be created!"
  #     render :new
  #   end
  # end

  def update
    if @post.update(post_params)
      flash[:success] = "Post updated."
      redirect_to posts_path
    else
      flash.now[:alert] = "Update failed."
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:image, :title)
  end

end
